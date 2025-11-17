#Respirometer Manual

Last Revised: Mass Lab - Tali Mass - 20230521

[FireSting-O2 PyroScience] (https://www.pyroscience.com/en/products/all-meters/fso2-c4)  
[OXROB10 PyroScience] (https://www.pyroscience.com/en/products/all-sensors/oxrob10)  
Chamber stirring system  


Protocol for Respirometry (oxygen flux in sealed chambers) using the PyroScience FireSting sensor, probes and software in a temperature controlled setting. This includes Apex controller for temperature manipulation and control of the respirometry water baths.




# **Contents**  
- [**Supplies**](#Supplies)
- [**Water Bath Setup**](#Bath)   
- [**Temperature Control**](#Temperature)
- [**Connecting the Battery**](#Battery)   
- [**FireSting Setup**](#FireSting)
- [**Software Setup**](#Software_Setup)
- [**Running the Program and Exporting Data**](#Run_Program_Export_Data)
- [**Probe Calibration**](#Calibrate)       
- [**Stirring System Setup**](#Stir)  
- [**Filling and Securing Chambers**](#Chambers)  
- [**Inserting Oxy-10 Probes**](#Probes)  
- [**Final Chamber Checks**](#Final_Checks)  
- [**Water Changeover for Additional Runs**](#Water_Change)  
- [**Exporting Data**](#Data_Export)  
- [**Removing Chambers from Respirometer**](#Removing)  
- [**Take-Down and Clean Up**](#Take-Down)  
- [**Troubleshooting**](#Troubleshooting)  
- [**Chamber Oring Replacement**](#ChamberOring)  
- [**Stir System Oring Replacement**](#StirSystemOrings)   



<a name="Supplies"></a> **Supplies**

- [Oxygen meter and Sensors PyroScience](https://www.pyroscience.com/en/products/all-meters/fso2-c4)  
- [OXROB10 Oxygen Probes](https://www.pyroscience.com/en/products/all-sensors/oxrob10)    
- [Pt100 Temperature Probes] (https://www.pyroscience.com/en/products/all-sensors/tdip15) 
- [Pyroscience software of FSO2-C4 : Optical Oxygen & Temp Meter FireSting®-O2 (4 Channels] (https://www.pyroscience.com/en/downloads/laboratory-devices)  
- [Respirometer stand (with 4 screw-on legs) or underwater stirring plate](https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/20221103_104853_table%20and%20chambers.jpg?raw=true) 
	![Side view](https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/table%20with%20chambers.jpg?raw=true)
- [Replacement motor](https://www.maxongroup.com/maxon/view/service_search?query=459049) - Maxon Motors Part # 459049 - 110182 A-max 26, 7W 6v DC motor + 144035 Planetary Gearhead, 26B, 53:1
- [Replacement Switch](https://au.element14.com/itw-switches/19n402r15/microswitch-v4-roller-lever/dp/521875)
- [Silicon - DuPont Molykote 112 High Performance Silicon Food Grade](https://www.mcmaster.com/1204K42/)
- Stir system large orings - Oil-Resistant Buna-N O-Ring
3 mm Wide, 165 mm ID
- Stir system small orings - Oil-Resistant Buna-N O-Ring
3 mm Wide, 125 mm ID
- [Chambers](https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/Chamber.jpg?raw=true) (8 can be measured at any one time with the FireSting-O2)
	- MAKE SURE BOTH TOP AND BOTTOM OF THE CHAMBERS ARE LABELLED
- Magnetic stir bars x8 (35-40mm)
- Chamber screw key - ADD PHOTO HERE
- [Battery] (https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/Battery.jpg?raw=true)
	- Height	2.4" Width	5.3" Depth	1.3"
- [Battery Charger] (https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/Charger.jpg?raw=true)
- Strap Wrench
- Parafilm
- [Large cooler](https://smile.amazon.com/gp/product/B004QILD6W/ref=ppx_yo_dt_b_asin_title_o08_s00?ie=UTF8&psc=1)
	- Lenght 38.19 x width 17.32 x height 17.72 inches
- [Chiller x2](https://www.petco.com/shop/en/petcostore/product/aqua-euro-usa-max-chill-aquarium-chiller-110-hp)
	- e.g., AquaEuro 1/10 HP SKU 1457110
- [Chiller Tubing](https://www.mcmaster.com/5233K68/)
	- ID	1/2" and OD	3/4"
- [Chiller Pump - Hydor Centrifical Pump 300 All-Purpose Pump, 300 GPH](https://smile.amazon.com/gp/product/B003SNG9I8/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)
- [Aqueon Pro 300 Submersible Aquarium Heater, 300 Watts](https://www.petco.com/shop/en/petcostore/product/aqueon-pro-300-submersible-aquarium-heater)
- [Digital Thermometer Cat 150778](https://www.fishersci.com/shop/products/fisher-scientific-traceable-digital-thermometers-11/150778#?keyword=digital%20thermometer)
- [Light sensor and meter if measuring photosynthesis](https://www.apogeeinstruments.com/mq-510-full-spectrum-underwater-quantum-meter/)
- 0% oxygen calibration capsules
- [Minimum Data Sheet]()  

<a name="Bath"></a> **Water Bath Setup**

1. Make sure you choose a tank that can contain the respirometry stand (L49cm X W31cm X H32cm) and have an extra room for all coral fragments, or use two tanks, one for the respirometry stand and the other one for all coral fragments to grow in. Fill the tank with source water, enough to just fully submerge the chambers once the chambers are placed inside (~31-32 cm high).  
	- [Tank set up] (https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/Tank%20set%20up.jpg?raw=true)

Measure and record the temperature and salinity of the source water (where the corals are kept).

1. Fill the cooler with source water, enough to fully submerge the chambers once the stirring rack and chambers are placed inside, and set up the temperature of that water.

1. Place an aquarium pump and a heater into each bin. The pump(s) and heater(s) must be fully submerged before powering on. Plug in each piece of equipment, making sure the outlets have an appropriate voltage. Adjust the temperature of the bins so that they approximate the water temperature experienced by the coral being measured.  Power on the pump and check for water flow.

1. Add a heater to the cooler **The heater(s) must be fully submerged to the indicated locations for your brand of heater before powering on, or they can melt or crack**


1. While you wait for the bath and source water to reach the desired temperature, set up the FireSting O2 and prepare the stirring system and chambers.  


<a name="Battery"></a> **Connecting the Battery**

1. Make sure the battery is charged. 
1. Unscrew the cap of the sealed [battery compartment] (https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/Battery%20compartment.jpg?raw=true) on the underside of the respirometer and locate the red and black cables.  Attach the red clip to the positive terminal (marked in red) on the battery and the black clip to the negative terminal (marked in black).  Test your connection and battery power by turning the switch on the other side of battery compartment [**clockwise**] (https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/battery%20power.jpg?raw=true).  The conveyor belt should start moving at a quick pace.  Turn the switch off.  
1. If the belt does not move or moves slowly, the battery needs to be switched out and recharged.  
1. As an additional check, you can unscrew a chamber base, insert a stir bar in the center divet of the base, then reseal the chamber.  Place the chamber in one of the chamber slots and note the rotation speed of the stir bar.  If the stir bar is spinning slowly or not at all, the battery needs to be switched out and recharged.  

1. Place the connected battery inside the compartment **gently** and screw the lid on tightly, making sure the o-ring is properly positioned.  Use a boa grip to tighten the lid with 1-2 quarter turns, then wrap with parafilm around the lid to seal the cap as a backup.
1. The connection point of the wires are very delicate.  Rough handing or too much tension on the wires from twisting may disconnect the wire from its base, requiring soldering to reattach the the metal foot of the wire to the metal point on the base.  If this disconnectin occurs, see [Troubleshooting](#Troubleshooting).  
1.  Once the battery is placed inside, and everything is sealed, do one last check of power to make sure the motor is running (observe the black bands moving along their tracks at quick speed), then turn it off to conserve the battery until you're ready to start your runs.

1. Once you are sure the battery compartment is water tight, submerge the respirometer in the cooler's water bath.  



<a name="FireSting"></a> **FireSting Setup**

Below is an example of the entire set-up. This can be modified to be specific to whatever lab or space you are in, but the **electronics need to be completely dry and far above/away from any potential water leak or water source**.  

![labeledoxysetup](https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/The%20whole%20set%20up.jpg?raw=true)

Be very delicate with the oxygen probes.  Leave the cap on the end when not in use and do not scratch the tip.  The oxygen cord should never be coiled too tightly or bent, or the sensor will break.

1.    Insert each numbered Temp probe into the corresponding Temp port on the FireSting by aligning the red dots and pushing gently until the dots meet.
1.    Remove the  **red caps on the FireSting Oxygen ports** and place all caps in the bag and in the Pyroscience suitcase. 
1.    Remove the caps on the oxygen probes you are going to use and place each cap in its bag.  
1.    Insert each numbered O2 probe into the corresponding O2 port  on the FireSting by aligning the metal pin on the port with the opening on the probe end.  Push in and turn the probe clockwise to catch the pin.
1.    Leave the black cap on the O2 probe until you’re ready to use the probe, then place these caps in the bag labeled “Oxygen Sensor Caps”.
1.    Plug the USB connector cord into your computer and the other end into the FireSting


![Oxygen meter](https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/images/20230105_10051_Oxymeter.jpg?raw=true) 

<a name="Software Setup"></a> **Software Setup**

## Final Chamber Checks

Last checks before starting to record data:  

1.	Stir bars spinning in place and at normal speed (If not, the battery needs to be switched out and recharged - see Take-Down instructions for proper procedures)
2. 	Chambers are securely fastened on the respirometer stand
3. 	No bubbles are present inside the chambers or on the sensors.
4. 	The sensors are snug and secure in the chambers
5.	The correct probes are in the correct chambers. 
6. 	All the data is recorded on your datasheet (Each fragment is associated with the correct Cell number and sensor number). 


### FireSting Measurement Manual Pyro Workbench Software Setup

Perform instructions in the correct order!!

## Set up
1.  Set-up one FireSting device with four oxygen sensors and one temperature sensor (Use the– Manual Pyro Workbench).
2. Choose to measure oxygen concentration with units of- µmol/L and record every 10 sec. 
3. Measure water salinity. 
4. Calibrate the oxygen sensors with air saturated seawater. Insert an air pump into a glass with ~700ml seawater and let it bubble for 10 minutes. Transfer the water to a metabolic cell, insert a magnetic stirrer and the oxygen sensor, close the hole with plasteline, let it stable and calibrate 
5. •	Insert the coral fragments to the chambers (one fragment into one cell) and leave one cell empty (blank- for measuring the oxygen production/consumption of the sea water). The plugs with the coral fragments should be held by the screw inside the chambers. Once the source water is at the desired temperature, submerge the chamber top and bottom and shake off or wipe away any air bubbles. Screw the plug with the coral fragment to the bottom of the chamber, while underwater. Then fill the other part of the chamber with water, insert a magnetic stir bar and close the chamber. Flip it, open the plastic lid (place the plastic screw in a bag) and let it fill with water, then, screw the chamber into the table. Make sure that they are tightly screwed and that the water level covers the chambers.     
6. Insert an oxygen sensor to each cell, through the hole at the top of the chamber. The sensor tip should be at least 2 cm into the chamber, and not more than a half of it should be submerged in the water. ![coral in the chamber] ( 
7. Use a syringe to fill in with seawater or to take out all the air bubbles and seal the holes with plasteline (after you insert the oxygen sensor). 
8. Turn the stir system power switch to on, and check for proper stir bar placement. If any stir bars are not spinning or are out of place, try to place it using a stir bar stick or loosen the bolt and gently jiggle the chamber until the bar is reset in the center of the divot.
9. When all chambers are ready, immerse the temperature sensor (Pt100) into the water tank.
10. Cover the cells for 30 minutes in complete darkness. 
11. After 30min of acclimation to the dark, oxygen conc. will be measured first in the dark and then in six increasing light intensities (50, 100, 200, 300, 400, and 600  µmol photons/m-2/s-1), which will elevate every 15min. 


## Oxygen sensor installation

Be very delicate with the oxygen probes. Leave the cap on the end when not in use and do not scratch or touch their tips. The oxygen cord should never be coiled too tightly or bent, or the sensor will break.

1. Remove the red caps on the FireSting Oxygen ports and place them in a bag and in the Pyroscience suitcase.  
2. Remove the caps on the oxygen probes you are going to use and place each cap in its bag. 


<a name="Calibrate"></a> **Probe Calibration**

1. Calibrate the temperature (Pt100) and oxygen sensors [Use the Pyro Workbench & Data Inspector manual] (https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/Files/Manual%20Pyro%20Workbench.pdf)   and measure water salinity:
2. Calibrate the Pt100 temperature sensor first [use the Optical Temperature Sensors Manual] (https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/Files/Manual_Optical_Temperature_Sensors%20(1).pdf)  
3. Calibrate the oxygen sensors [use the oxygen sensors manual] (https://github.com/talimass/Talimass_Lab_Notebook_Mass_Lab/blob/master/Files/Manual_FSO2-C.pdf)     
4. 2-point calibration (optional): upper and 0% calibration; recommended for measurements at low O2 and high accuracy measurements over the full range. 
5. For seawater saturated with air, insert an air pump into a glass with 600ml seawater and let it bubble for 10 minutes. Insert the oxygen and temperature sensor into the glass and ensure that the sensor tips are immersed in the water and are free of air bubbles then measure it and let it stable. 
For de-oxygenated water Fill 50ml of demineralized water (DO NOT USE SEAWATER FOR THIS CALIBRATION) into a glass flask (e.g. Duran flask)



<a name="Stir"></a> **Stirring System Setup**
![Oxy10 Front](https://github.com/Putnam-Lab/Lab_Management/blob/master/images/oxy10_base.JPG?raw=true)  

Check all orings connecting the drive motor to the stirplate for cracks. Lubricate with silicon before each run as needed

1. Unscrew the cap of the sealed battery compartment on the underside of the respirometer and locate the red and black cables.  ADD PHOTO HERE Attach the red clip to the positive terminal (marked in red) on the battery and the black clip to the negative terminal (marked in black).  
	- The connection point of the black wire is very delicate.  Rough handing or too much tension on the wires from twisting may disconnect the wire from its base, requiring soldering to reattach the the metal foot of the wire to the metal point on the base.  If this disconnectin occurs, see [Troubleshooting](#Troubleshooting).  
1. Test your connection and battery power by turning the switch on the other side of battery compartment **clockwise**. ADD PHOTO HERE The stirring system should start moving at a quick pace.  Turn the switch off.  
    - If the system does not move or moves slowly, the battery needs to be switched out and recharged.  
    - As an additional check, you can unscrew a chamber base, insert a stir bar in the center divet of the base, then reseal the chamber.  Place the chamber in one of the chamber slots and note the rotation speed of the stir bar.  If the stir bar is spinning slowly or not at all, the battery needs to be switched out and recharged.  ADD PHOTO HERE

1. Place the connected battery inside the compartment **gently** and screw the lid on tightly, making sure the o-ring is properly positioned.  Use a boa grip to tighten the lid with 1-2 quarter turns, then wrap with parafilm around the lid to seal the cap. ADD PHOTO HERE

    -  Once the battery is placed inside, and everything is sealed, do one last check of power to make sure the motor is running (observe the black bands moving along their tracks at quick speed), then turn it off to conserve the battery until you're ready to start your runs.

1. Once you are sure the battery compartment is water tight, submerge the respirometer in the cooler's water bath and look for excessive bubbles.  

1. Situate the heater so it is fully submerged but not touching the respirometer stand or the Apex temp probe, and away from the battery compartment if possible.  
    - Consider the best placement of the temp probe, heater, and chiller outflow for adequate water monitoring and circulation.  Ex. Temp probe along the back of the cooler, centered.  The heater suction cupped on one far side of the cooler.  The chiller inflow and outflow placed on the opposide far side of the cooler. ADD PHOTO HERE
<a name="Chambers"></a> **Filling and Securing Chambers**

![Oxy10 Front](https://github.com/Putnam-Lab/Lab_Management/blob/master/images/oxy10_singlechamber.JPG?raw=true)
![Oxy10 Front](https://github.com/Putnam-Lab/Lab_Management/blob/master/images/oxy10_chamberbase.JPG?raw=true)


1. Unscrew the bottom from a chamber and place a magnetic stir bar in the center divet. Once the source water is at the desired temperature, submerge the chamber top and bottom and shake off or wipe away any air bubbles.   - ADD PHOTO HERE
    - If including organisms, secure them in the bottom of the chamber before screwing the top and bottom together until **hand tight**.  Check again for bubbles and remove any as necessary.  **Record the time of when you seal each chamber** and leave submerged to maintain temperature until ready to secure on the respirometer.  ADD PHOTO HERE
    - The probes will need to reach the submerged chamber without straining the wire, [insert the probes into the chamber](#Probes) at this time before placing the chambers onto the respirometer.
- ADD PHOTO HERE

1. Use the screw key to loosen the bolts of the holding plates on the respirometer just until the plates are moveable but not detached.  
- ADD PHOTO HERE

1. Place the chamber in a chamber slot and then <a name="Probes"></a> insert the Oxy-10 probes.

![Oxy10 Chambers with Probes](https://github.com/Putnam-Lab/Lab_Management/blob/master/images/oxy10_chambers.JPG?raw=true)

- Be careful to not damage the probes or introduce bubbles to the chamber, insert the temperature probe into the larger probe port and gently guide it down until it fits snuggly and securely.
- Once the temperature probe is in place, gently guide the oxygen probe into its port, being careful to not scratch the probe tip.  The probe tip should be at least 2 cm into the chamber, but can be inserted farther, as long as the probe isn't touching any organisms or objects in the chamber.
    - ADD PHOTO HERE
1. Check for bubbles inside the chamber.  If any bubbles are present, remove them at this time.  
      - You may be able to guide small bubbles out of the airlock seal on the chamber lid by unscrewing the airlock seal and guiding the bubbles out, then rescrewing on the airlock finger tight.
      - ADD PHOTO HERE  
      - Note that if cooler water is not from the same source as your second bin water (used to fill the chambers), you must remove air bubbles only while submerging the chamber in the second bin's water.
      - If there are large bubbles or a large quantity of bubbles after moving the chamber, remove the chamber from the respirometer, place back into the source water, unscrew the bottom to wipe or shake away any bubbles, then close and re-secure the chamber.  Note the new time of when you sealed the chamber.  


2. Repeat for all 10 chambers, filling at least one chamber with only water, without any organisms, for a "BLANK" dataset to account for background oxygen flux.

1. Once all chambers are in place, with probes and no bubbles, tighten the screws on the respirometer finger tight, making sure the holding plates are over the chamber bottoms.  - ADD PHOTO HERE Test if the chambers are secure by attempting to gently move the chambers.  There should be no movement.  

1. Once all chambers are secure, turn the stir system power switch **clockwise** to on, and check for proper stir bar placement.  If any stir bars are not spinning or are out of place, loosen the bolt and gently jiggle the chamber until the bar is reset in the center of the divot.
    - If necessary, remove the chamber, place back into the source water, unscrew the bottom to move the stir bar into place, then close and re-secure the chamber.  Note the new time of when you seal the chamber.  

<a name="Final_Checks"></a> **Final Chamber Checks**

Last checks before starting to record data using the PreSens program:  

1. Stir bars spinning in place and at normal speed (If not, the battery needs to be switched out and recharged - see [Take-Down](#Take-Down) instructions for proper procedures)  

1. Chambers are securely fastened on the respirometer stand  

1. No bubbles are present inside the chambers  

1. The correct probes are in the correct chambers (Every numbered temperature probe is with its corresponding numbered oxygen probe and in the numbered chamber you've assigned to the probe pair). Make sure you have recorded this on your datasheet.  

1. The probes are snug and secure in the chambers  


<a name="Water_Change"></a> **Water Changeover for Additional Runs**

If using the respirometer at more than one temperature (i.e. Thermal Performance Curves)

1. Once all the chambers are out of the source water and you've started recording data for your current run, do a water change (if necessary) of your source water and program the Apex to your new desired temperature.  

1. Once you've stopped recording data for your current run, program the Apex for the water bath to your new desried temperature (same as the source water).  

1. While you wait for the temperature in your bath water to stabilize, collect water samples, if needed for your data set, or start [preparing the chambers](#Chambers) with the new source water using the same steps above.

<a name="Removing"></a> **Removing Chambers from Respirometer**

1. Turn off the battery by turning the switch **counter-clockwise**.  

1. Remove the probes and carefully place or drape them in a secure location.  

1. Unscrew the holding plates and remove the chambers.  
1. **YOU MUST MEASURE THE TOTAL VOLUME OF WATER IN THE CHAMBER IN ORDER TO CALCULATE THE RATE TAKING INTO ACCOUNT THE SAMPLE WATER DISPLACEMENT**

1. If saving water samples, note the time when you either unscrew the airlock seal on the lid (best method for pouring the water into another container) or unscrew the bottom (keep the chamber upside down for this method).  

1. Unscrew the bottom of the chamber to fully drain the water, then place the two chamber parts in the source water.  
    1. If you have any organisms secured in the bottom of the chamber, be as swift as possible to minimize time spent out of the water.  

1. Keep the chamber lid very near or loosely on top of the chamber bottom, unscrewed, to not confuse which organism goes in which numbered chamber, while still allowing for water flow until you're ready to move the chambers to the water bath.

1. Once the source water and water bath are at the desired temperature, follow the same steps to [fill and secure the chambers](#Chambers) to prepare for your next run.  

<a name="Take-Down"></a> **Respirometer Take-Down and CleanUp**

1. Turn off the Apex and
2. Turn off the power to the respirometer battery by turning the switch **counter-clockwise**.

1. Remove the probes and carefully place or drape them in a secure location.

1. Unscrew the holding plates and remove the chambers.  
    1. If collecting water samples, note the time when you either unscrew the airlock seal on the lid (best method for pouring the water into another container) or unscrew the bottom (keep the chamber upside down for this method).  

1. Remove any organisms from the chambers and store or dispose of those organisms as appropriate.

1. Drain the source water bin and fill with fresh water.

1. Place the unsealed chambers, stir bars, heaters, aquarium pumps, and temperature probes in the bin to soak, keeping all outlet plugs out and away from the water.  
    1. Let the pumps run for some time (without the chiller being on) to flush fresh water through the hoses.  

1. Taking the respirometer out of the water bath  
    1. When lifting the stand out of the bath, keep it tilted slightly so that the lid to the battery compartment is lower than the opposite side with the power switch.  
    1. If any water seeped into the battery compartment, this will force the water away from other electrical components of the compartment.  
    1. Drain the water bath and refill with fresh water.  Place the respirometer in the fresh water to soak.  

1. While letting everything soak, collect and organize the Oxy10 probes so the Oxygen probes are together and the temperature probes are together  
    1. Fill two beakers with DI water and gently drape the probes over a line or surface so the probe tips (any portion exposed to the water) are submerged in DI, with O2 probes in one beaker and temp probes in another.  

1. Breaking down the respirometer after soaking  
    1. Lift the respirometer out of the freshwater bath using the same tilt method as before.
    1. Remove the parafilm and use a boa grip to loosen the cap utnil you can unscrew it by hand.  
    1. Take out the battery and detach the positive and negative clips from the battery terminals.  
    1. Check for any leaked water by wiping a towel, cloth, or chemwipe around the inside of the compartment.  
    1. Place the respirometer on a stable surface to dry overnight (with the battery compartment opening-side down).  

1. Using a clean rag or chemwipe with ethanol, wipe down the cord of each Oxy10 probe to remove any remaining salt deposits or particulates, then recoil the probes and store in their original labeled bags.  
	- Be extremely careful when handling probes and make sure to avoid touching the Oxygen probe tips as they are the most sensitive.


12. Leave items to soak overnight if possible, then remove from the fresh water and place on a clean surface to dry.  


<a name="Troubleshooting"></a> **Troubleshooting**



**Disconnected battery wire**

- Access the battery compartment by simply unscrewing (rotating counterclockwise) the PVC tubing which holds the battery and connections. No screwdrivers are required.
- A temporary hold may be aquired using electrical tape until you can solder the affected wire.
- A soldering iron with a fine tip is needed to reconnect the end of the wire to a small square attachment point inside the battery compartment. Before soldering, test the appropriate connection point by holding the end of the wire to the metal connection point and turning the motor ON.
- Do NOT touch any metal while the motor is on.
- Once a connection point is found, use a heated soldering iron and solder to seal that connection. Let rest for a few minutes, then test the motor by turning it ON again.

<a name="Chamber Oring Replacement"></a> **ChamberOring** (make video)

<a name="Stir System Oring Replacement"></a> **StirSystemOrings** 

[Stirring O-ring Replacement](https://github.com/Putnam-Lab/Lab_Management/blob/master/images/Stand_Oring_replacement.mov)

Remove bolts holding top and bottom plates together

Save all bolts and plastic spacers

Remove old orings

Replace center orings with 2 of the longer 165mm orings  
![Central Orings](https://github.com/Putnam-Lab/Lab_Management/blob/master/images/stand_oring2.png?raw=true)  

Replace the outer 4 with the shorter 125mm orings   
![Outer Orings](https://github.com/Putnam-Lab/Lab_Management/blob/master/images/stand_oring4.png?raw=true)  

Connect to center motor hub  

Replace plastic spacers  

Replace top plate  

Replace and tighten bolts  


<a name="references"></a> **References**  
* * [Putnam Lab Protocol] (https://github.com/Putnam-Lab/Lab_Management/blob/master/Lab_Resources/Equipment_Protocols/Respirometry_Protocol/Respirometry_Manual.md)  
* * [Silbiger Lab Protocol](https://github.com/SilbigerLab/Protocols/tree/master/Physiological_Parameter_Protocols/Protocols/Respirometry_Protocol)
