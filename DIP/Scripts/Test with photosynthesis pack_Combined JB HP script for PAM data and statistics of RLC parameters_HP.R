library(tidyverse)
# library(lubridate)
library(ggplot2) 
#install.packages(photosynthesis)
library(photosynthesis)
# library(phytotools)
# library(plyr)
# library(tidyr)
# library(dplyr)
# library(reshape2)
# library("devtools")
# library("segmented")
# library("plotrix")
# library("gridExtra")
# library("lubridate")
# library("chron")
 library("broom")
# library("ggpubr")
# library("minpack.lm")
# library("ggpmisc")





#calculating RLC parameters using phytotools (pratt 1980)
#setwd("G:/Shared drives/Jessica Bellworthy/R/RapidLightCurves")

PLATE1
# Import data
#{r import_data}
Data <-read.csv("/Users/hputnam/Downloads/plate_4_ASF.csv", header=T, sep=";", na.string="NA") #reads in the data files
Data <- Data[, c("Date", "Time", "PAR", "ETR1","ETR2","ETR3","ETR4")]# change the ETR according the data
# change format from wide to long
Data <- Data %>%  pivot_longer(., cols = starts_with("etr"), names_to = "id")
Data$value <- na_if(Data$value, 0)
#need to Remove all data at PAR values above where ETR hits zero
Data$PAR <- as.numeric(Data$PAR)
colnames(Data)[5] ="ETR"

Data<-Data%>%  mutate_all(funs(replace(., is.na(.), 0)))

#plot all data
Data %>%
  ggplot(aes(x=PAR, y=ETR, color=id))+
  geom_point()+
  geom_line()+
  facet_wrap("id")+
  theme_bw()

#Remove outliers of ETR
Data <- Data %>%
  subset(ETR<40)

#plot data again
Data %>%
  ggplot(aes(x=PAR, y=ETR, color=id))+
  geom_point()+
  geom_line()+
  facet_wrap("id")+
  theme_bw()


# Set column order PAR - ETR - ID
rlc.data <- Data
rlc.data$colony <- as.factor(rlc.data$id)


#rlc.data$ETR <- na_if(rlc.data$ETR, 0)
View(rlc.data)

#rlc.data <- data.frame(stringsAsFactors=FALSE)

ncurves <- length(unique(rlc.data$id)) # number of unique ids in the data 
ids <- unique(rlc.data$id) # store the unique ids 

str(rlc.data)

rlc.parameters <- data.frame(
  id = ids, 
  alpha = 0, 
  beta = 0, 
  ETRmax = 0, 
  Ek = 0, 
  ps = 0
)

#photosyntehsis packedge 
#https://cran.r-project.org/web/packages/photosynthesis/photosynthesis.pdf
#https://cran.r-project.org/web/packages/photosynthesis/vignettes/light-response.html
#k_sat = Pmax
#phi_J = alpha, maximum quantum yield
#theta_j = curvature parameter (unitless)
#Rd = dark respration, but will not be realistic if it is an ETR curve and 
#not a PI curve, becasue ETR starts at 0 and not -rates of respiration

rlc<-fit_photosynthesis(filter (rlc.data, colony=="ETR2"),.photo_fun = "aq_response",
                   .vars = list(.A = ETR, .Q = PAR))
summary(rlc)

library(purrr)

fits = rlc.data |>
  split(~ id) |>
  map(fit_photosynthesis, .photo_fun = "aq_response", .vars = list(.A = ETR, .Q = PAR))

## Estimated parameters:
fits |>
  map(coef) |>
  map(t) |>
  map(as.data.frame) |>
  imap_dfr(~ mutate(.x, CO2_s = .y))


### works through here















# The 'rlc' object inherits class 'nls' and many methods can be used

## Model summary:
summary(rlc)

## Estimated parameters:
coef(rlc)

## 95% confidence intervals:
#confint(rlc)

## Tidy summary table using 'broom::tidy()'
#tidy(rlc, conf.int = TRUE, conf.level = 0.95)

## Calculate light compensation point
coef(rlc) |>
  t() |>
  as.data.frame() |>
  mutate(LCP = ((Rd) * (Rd * theta_J - k_sat) / (phi_J * (Rd - k_sat)))) |>
  sum(resid(rlc) ^ 2) ## Calculate residual sum-of-squares

b = coef(rlc)

df_predict = data.frame(Qabs = seq(0, 0.84 * 1000, length.out = 100)) |>
  mutate(
    A = marshall_biscoe_1980(
      Q_abs = Qabs,
      k_sat = b["k_sat"],
      b["phi_J"],
      b["theta_J"]
    ) - b["Rd"]
  )

ggplot(mapping = aes(Qabs, A)) +
  geom_line(data = df_predict) +
  geom_point(data = filter(rlc.data, colony == "ETR2"),x=A, y=Qabs) +
  labs(
    x = expression("Irradiance (" * mu * mol ~ m^{-2} ~ s^{-1} * ")"),
    y = expression(A[net] ~ "(" * mu * mol ~ m^{-2} ~ s^{-1} * ")")
  ) +
  theme_bw()




#for (i in 1:ncurves){
  
  temp.id = ids[i] # extract the id of the curve to be rlcted
  
  print(paste("Now rlcting curve ", as.character(temp.id))) # to keep track what's happening if the data has many curves
  
  temp.rlc.data <- rlc.data[rlc.data$id==temp.id,] # extract the the data of a single curve into a temporary variable
  PAR = temp.rlc.data$PAR 
  ETR = temp.rlc.data$ETR
  
  rlc = rlcPGH(PAR, ETR, rlcmethod = "Port") # for more options and explanation see package phytotools manual
  
  # store the rlcted RLC values into temporary variables
  alpha.rlc = rlc$alpha[1]
  beta.rlc = rlc$beta[1]
  ps.rlc = rlc$ps[1]
  
  # store the parameters
  rlc.parameters$id[i] <- temp.id
  rlc.parameters$alpha[i] <- alpha.rlc
  rlc.parameters$beta[i] <- beta.rlc
  rlc.parameters$ps[i] <- ps.rlc
  
  # calculate ETRmax and Ek for the PGH model (see e.g.Ralph & Gademann 2005 Aquatic Botany 82 (3): 222 - 237). 
  # Note that the equation depends on the model rlcted, the code below applies only to the PGH model! 
  # Model equations are documented in the phytotools package code examples (and in the original papers): https://cran.r-project.org/web/packages/phytotools/phytotools.pdf
  
  ETRmax = ps.rlc*(alpha.rlc/(alpha.rlc + beta.rlc))*(beta.rlc/(alpha.rlc+beta.rlc))^(beta.rlc/alpha.rlc)
  Ek = ETRmax/alpha.rlc 
  
  # store the variables
  rlc.parameters$ETRmax[i] <- ETRmax
  rlc.parameters$Ek[i] <- Ek
  
  #plotting the curve and rlcted model into a tiff file. By default the file name is the id of the curve. 
  tiff(file=paste0(temp.id, ".tiff"), compression="lzw")
  
  # plot the data, 
  plot(x=PAR, y=ETR, main=temp.id) 
  
  # plot the model rlc
  with(rlc, {
    P <- ps.rlc*(1-exp(-1*alpha.rlc*PAR/ps.rlc))*exp(-1*beta.rlc*PAR/ps.rlc) # the PGH model equation
    lines(PAR,P)
  }
  ) # end of with
  dev.off() #close the plotting devide. if this is not done, the next run of the loop will override the plot. 
  
}

# now the data frame rlc.parameters contains the rlcted values for each curve. Tiff plots should be in current working directory. 
rlc.parameters
View(rlc.parameters)


warnings()

#rlc.parameters_first <- rlc.parameters
#View(rlc.parameters_first)

write.csv(file="rlc.parameters.oculinaproject.csv",rlc.parameters)


#### check statistical differences
library(lme4)
library(nlme)
library(lmerTest)
library(MASS)
library(car)
library(predictmeans)

rm(rlc.parameters)
# Get FvFm 
d_PAM <- read.csv(file="all PAM_data.csv")
View(d_PAM)
FVFM <- subset(d_PAM, d_PAM$PAR=='1')
View(FVFM)
names(FVFM)[8]<-paste("FVFM")

###manualy copy the FVFM to the rlc parameter data  

##manually calculate maxNPQ for each colony 

np <- read.csv(file = "all PAM_data.csv")
names(np)[1]<-paste("id")
head(np)
str(np)

## NPQmax
npq_max <- ddply(np, .(id,depth), summarise,
      max = max(NPQ, na.rm = F))
view(npq_max)

d <- read_csv('rlc.parameters.oculinaproject_NEW.csv')

head(d)
View(d)
d$depth <- as.factor(d$depth)
d$id <- as.factor(d$id)

etrMAX <- lm(ETRmax~depth, data=d)
summary(etrMAX)
anova(etrMAX) 
# No sig diff p = 0.5074

#summary(glht(etrMAX, linfct=mcp(treatment="Tukey")))

#normality assumptions - OK
shapiro.test(d$ETRmax)
leveneTest(ETRmax~depth,d=d)

###alpha
Alpha <- lm(alpha~depth, data=d2) # with the anomaly removed p = 0.7109
anova(Alpha)
# No sig diff p = 0.321

#summary(glht(Alpha, linfct=mcp(treatment="Tukey")))

#normality assumptions -
shapiro.test(d2$alpha) #OK - with anomaly removed
leveneTest(alpha~depth,d=d) #OK

###eK
head(d)
eK <- lm(Ek~depth, data=d)
summary(eK)
anova(eK)
# No sig diff p = 0.538
#summary(glht(eK, linfct=mcp(treatment="Tukey")))

#normality assumptions -ok
shapiro.test(d$Ek)
leveneTest(Ek~depth,d=d)

###FV/FM
head(d)
fv <- lm(fvfm~depth, data=d)
anova(fv)
# No sig diff p = 0.132
#summary(glht(fv, linfct=mcp(treatment="Tukey")))

#normality assumptions
shapiro.test(d$fvfm) ### not normally distributed, two low deep outliers
leveneTest(fvfm~depth,d=d)
qqnorm(d$fvfm)


###beta
head(d)
b <- lm(beta~depth, data=d)
anova(b)
# No sig diff p = 0.6228


#normality assumptions
shapiro.test(d$beta) ### not normally distributed
leveneTest(beta~depth,d=d)
qqnorm(d$fvfm)


## summary of results 
library(plotrix)
# Remove one outlier from Ashdod deep - no Y(II) and no ETR, gives very high false alpha. Replace with NA but keep this sample in other columns
d2 <- read_csv('rlc.parameters.oculinaproject_NA.csv')


View(d2)

Sum_all <- d2 %>% 
  group_by(depth) %>% 
  summarise_each(funs(mean(., na.rm=TRUE), n = sum(!is.na(.)),
                      se = sd(., na.rm=TRUE)/sqrt(sum(!is.na(.)))), alpha:fvfm)

View(Sum_all)
write.csv(file="rlc.averages.oculinaproject_removedoutlier.csv", Sum_all)


#### Graphics in Box plots
#ETRmax
p.etr = ggplot(d, aes(y = ETRmax, x = depth)) +
  geom_boxplot()+
  geom_point()+
  theme_classic()+
  theme(axis.title.x = element_blank(), axis.text = element_text(colour = "black"))

#note here the removal of the outlier
p.alpha = ggplot(d2, aes(y = alpha, x = depth)) +
  geom_boxplot()+
  geom_point()+
  theme_classic()+
  theme(axis.title.x = element_blank(), axis.text = element_text(colour = "black"))

p.beta = ggplot(d, aes(y = beta, x = depth)) +
  geom_boxplot()+
  geom_point()+
  theme_classic()+
  theme(axis.title.x = element_blank(), axis.text = element_text(colour = "black"))

p.ek = ggplot(d, aes(y = Ek, x = depth)) +
  geom_boxplot()+
  geom_point()+
  theme_classic()+
  theme(axis.title.x = element_blank(), axis.text = element_text(colour = "black"))

p.fvfm = ggplot(d, aes(y = fvfm, x = depth)) +
  geom_boxplot()+
  geom_point()+
  theme_classic()+
  theme(axis.title.x = element_blank(), axis.text = element_text(colour = "black"))

#install.packages("cowplot")
library(cowplot)

rlc.plots <- plot_grid(p.etr, p.alpha, p.beta, p.ek, p.fvfm, labels = c('A', 'B', 'C', 'D', 'E'),
                      label_x = 0.15, label_y = 0.985, label_size = 14,ncol = 2, align = "v", byrow = F, hjust =2)
rlc.plots
ggsave("PAM_OculinaProject2020.jpeg", plot = rlc.plots, width = 10, height = 18,dpi=600, 
       units = "cm")





###graphics for light curve data against PAR on xaxis

d <- read.csv("all PAM_data.csv")
head(d)
names(d)[8]<-paste("effective")


p_rETR <-  ggplot(d, aes(y=rETR*0.5, x=PAR, colour=depth,group=depth)) + 
  #geom_point(size=2,alpha=0.5)+
  geom_smooth(size=2,alpha=0.5,na.rm = FALSE,level=0.95)+
  #geom_errorbar(data=Sum_all, aes(ymin=ETRmax_mean-ETRmax_se, ymax=ETRmax_mean+ETRmax_se)
  scale_color_jco() +
  theme_bw() %+replace% 
  theme(legend.position="none",
        axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(), panel.grid.minor.y=element_blank(), 
        panel.background = element_blank(),
        axis.title =element_text(size=12),
        axis.text=element_text(size=12),
        axis.text.x = element_text(size=12))+
  #scale_x_continuous("PAR", labels = as.numeric(PAR), breaks = PAR)+
  xlab(bquote('?mol photons '~ m^-2~s^-1*''))+ylab('Relative ETR')
# labs(x=parse(text='Âµmol photons, m^-2s^-1'),y=parse(text='rETR'))+
#guides(fill=guide_legend(title="Treatments"))
p_rETR

p_effective <-  ggplot(d, aes(y=effective, x=PAR, colour=depth,group=depth)) + 
  #geom_line(size=0.5)+#geom_point(aes(shape=treatment, color=treatment))+
  #geom_errorbar(aes(ymin = mean_eff-se, ymax= mean_eff+se),  
  #width=.5, position=position_dodge(0.05))+
  #geom_point(aes(colour= treatment),size=1,alpha=0.5)+
  geom_smooth(size=2,alpha=0.5,na.rm = FALSE,level=0.95)+
  scale_color_jco() +
  theme_bw() %+replace% 
  theme(legend.position="none",
        axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(), panel.grid.minor.y=element_blank(), 
        panel.background = element_blank(),
        axis.title =element_text(size=12),
        axis.text=element_text(size=12),
        axis.text.x = element_text(size=12))+
  #xlab(bquote('Âµmol photons' ('m^-2 s^-1')))
  xlab(bquote('?mol photons '~ m^-2~s^-1*''))+ylab('Effective quantum yield')
#labs(x=expression(paste("Âµmol photons ", m^{-2})),y='Effective quantum yield')
p_effective

p_NPQ2 <-  ggplot(d, aes(y=NPQ, x=PAR, colour=depth,group=depth)) + 
  #  geom_line(size=0.5)+#geom_point(aes(shape=treatment, color=treatment))+
  # geom_errorbar(aes(ymin = mean_eff-se, ymax= mean_eff+se),  
  #              width=.5, position=position_dodge(0.05))+
  #geom_point(aes(colour= treatment),size=2,alpha=0.5)+
  geom_smooth(size=2,alpha=0.5,na.rm = FALSE,level=0.95)+
  scale_color_jco() +
  theme_bw() %+replace% 
  theme(legend.position="left",
        axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(), panel.grid.minor.y=element_blank(), 
        panel.background = element_blank(),
        axis.title =element_text(size=12),
        axis.text=element_text(size=12),
        axis.text.x = element_text(size=12))+
  xlab(bquote('?mol photons '~ m^-2~s^-1*''))+ylab('Non-photochemical quenching')+
  # scale_x_continuous(limits  = c(21, 32), breaks = seq(21, 32, by = 1)) 
  #labs(x=expression(paste("Âµmol photons ", m^{-2})),
  #      y='Non-photochemical quenching')+
  # labs(x=parse(text='Âµmol photons, m^-2s^-1'),y=parse(text='rETR'))+
  guides(color=guide_legend(override.aes=list(fill=NA)))
p_NPQ2

ggsave("for legend.tiff", plot = p_NPQ2, width = 8.5 , height = 8 ,dpi=600, 
       units = "cm")

one_grid <- plot_grid(p_rETR2, p_effective, p_NPQ2, labels = c('A', 'B', 'C'),
                      # A negative rel_height shrinks space between elements
                      label_x = 0.15, label_y = 0.985, label_size = 14,ncol = 1)
one_grid
ggsave("RLC_June2020.tiff", plot = one_grid, width = 8.5 , height = 21 ,dpi=600, 
       units = "cm")
