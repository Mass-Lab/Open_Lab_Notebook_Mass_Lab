---
layout: post
title: qPCR homwork research method 
category: [ ]
tags: [  ]
---
**calculations:**  
1. Calculate ΔCt (Delta Ct):  
2. Δ𝐶𝑡=𝐶𝑡target−𝐶𝑡reference  
3. ΔΔ𝐶𝑡=Δ𝐶𝑡experimental-Δ𝐶𝑡control  
4. Fold Change = 2 ^-ΔΔCt  

**results**

| ΔCt / Gene        | ascs    | Delta   | ets     | foxA    | gcm     | NGN     | opt     | pak3    | pak4    | pitx    | SM30    | sm50    | soxC    | synB    |
|------------------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|
| DMSO Control     | 5.79849 | 2.66812 | 1.42121 | 1.07032 | 5.05876 | 5.05562 | 7.72489 | 2.11021 | 2.27556 | 6.38260 | -2.32677| 0.40464 | 1.77651 | 0.83064 |
| Inhibitor Treat. | 5.78996 | 2.81930 | 1.71864 | 1.00376 | 5.45955 | 4.63422 | 8.98946 | 2.57608 | 2.53384 | 9.00546 | -0.95235| 2.09203 | 1.60920 | 1.34077 |
| ΔΔCt             | -0.0085 | 0.15118 | 0.29743 | -0.0666 | 0.40079 | -0.4214 | 1.26457 | 0.46587 | 0.25828 | 2.62286 | 1.37442 | 1.68739 | -0.1673 | 0.51013 |
| R (Fold Change)  | 1.00593 | 0.90051 | 0.81370 | 1.04722 | 0.75744 | 1.33922 | 0.41622 | 0.72403 | 0.83609 | 0.16235 | 0.38571 | 0.31049 | 1.12297 | 0.70216 |
 
![qPCR results](https://github.com/arikattia/arik_attia_Notebook/blob/master/images/qPCR.png)
 
Value = 1 (log₂ = 0): No change in expression.  
Values < 1: Decreased expression (gene suppression).  
Values > 1: Increased expression (gene activation).  
**discussion**  
•	We can see that we have Strong Downregulation in: pitx (Sharp decrease - most strongly suppressed by the treatment), sm50 (Strong repression, SM30 (Marked reductio), opt (Significantly lowered expression).  
•	We can see that we have Moderate Downregulation in: synB, pak3, pak4, gcm, ets, Delta – Show 10–50% reduction in expression.  
•	We can see that we have Stable / Minimal Change in: ascs, foxA, soxC – Expression levels close to 1 → indicating no major change relative to the control.  
•	And finally, we can see that we have Upregulation in NGN – Elevated expression - the only gene clearly upregulated after treatment.  
•	soxC and foxA – Slight increase, though not significant.  
**Conclusions:**  
•	Genes like pitx, sm50, SM30 appear highly sensitive to the treatment – possibly involved in pathways directly inhibited by the compound.  
•	NGN shows relative activation – this might reflect a compensatory mechanism or activation of an alternative signaling pathway.  
•	Genes such as foxA and ascs maintain stable expression – suggesting they are either unaffected or regulated by distinct, treatment-independent pathways.  

