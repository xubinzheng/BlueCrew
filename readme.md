# BlueCrew

###High-Value Asset Tracking using Bluetooth Low Energy Beacon

There are application video in Gif file


<img src="https://raw.githubusercontent.com/xubinzheng/BlueCrew/master/Gif/BKondemo.gif"/>



#IBM IoT Design Challenge Application Team Blue Crew
###Team Members:
• Xubin “Jasper “ Zheng (Captain), Zhilan Zhou, Brea Dionisio, Manuel Zepeda
November 17, 2014



###Application:
• High-Value Asset Tracking using Bluetooth Low Energy Beacon
####Solving: Tracking assets in a hospital environment where the location of all important assets can be located. Not only is an asset’s current location noted but also its historical movement.
####Type: hybrid
￼￼

###Overview:
Traditionally for local area wireless connections there has existed a trade-off between power consumption and distance. With low energy Bluetooth (Bluetooth Smart) there is now an open, no- license-required wireless LAN technology that consumes much less energy than before while maintaining the same communication distance.
Team Blue Crew intends to use this new relatively low cost, low-power-consumption communication technology and an IoT backend to track the movement of high value assets. The scenario we first envision is tracking assets in a hospital environment where the location of all important assets can be located. Not only is an asset’s current location noted but also its historical movement.

Some of the features of keeping location history of assets/equipment are:

•Location on demand

•Over time which physical area or related groups have used an asset

•Is an asset on property or not, if not when and where was it last monitored


Some possible benefits in a hospital environment are:
•Effective and efficient utilization of equipment is vital. Does staff use equipment in manner intended and as much as planned?
•Obviously preventing theft of equipment saves costs and may lower capital equipment expenditures
•Perhaps quality of service to patients can be improved by monitoring overall pattern of equipment used in the hospital
•Inventory effort is vastly reduced
•Insurance costs may lower if systems preventing theft are in place


Advantages of Smart Bluetooth tracking application
Device – in many IoT applications the costs of the physical (BOM) device and its development are barriers since in many cases there is a costly custom aspect. Development costs are often vastly underestimated due to lack of understanding of RF and software effort. In the case of a Smart Bluetooth solution it is an off-the-shelf solution that requires no software development at the device level since a Smart Bluetooth beacon states its “name”. The device is ready today.

IoT Application Platform – The value-add development is performed at the “backend”. The customization needed for each IoT customer is performed at the platform level. The asset location history data is maintained, “mined”, and presented for customers in manner to provide highest value. There should be common needs among high asset customer types – hospital, R&D facilities, university campus, etc.


The frond-end part application fork the open source DropdownMenu from https://github.com/nmattisson/DropdownMenu






###Business Model
•	The key aspect of the model is to leverage the flexibility of the application platform and the simplicity of the BLE beacons and of oncoming near-term Low Power Wide Area technologies and devices.  Use a simple data point - the location of a given beacon at a given point in time -and leverage for maximum value at the application platform level.

•	Initial Model – Monitoring and control service

•	BlueCrew’s IoT application business model is hospital asset and patient location and movement history information as a service.  Blue Crew will generate monthly recurring revenue from each beacon point monitored by the service. 

•	Through a customer portal one can monitor the current location of assets as well as generate reports for location of assets at a given time or for the movement of equipment and patients over a given time.  Customer can add or remove beacons via the portal and can create asset and patient groups and hierarchies.  Via the portal one can create event types and how to flag. 

•	Different parts of the hospital organization can generate its own relevant custom reports. For example hospital operational staff such as nurses and maintenance can find current location of specific equipment; accounting staff can generate an inventory reports; staff can query the current location of patients; executive management can generate reports determining effective usage of equipment based on movement over time.

•	The Bluetooth Low Energy (BLE) beacons enable the service platform to effectively monitor and report due to their long life battery capability, small size, low cost, off-the-shelf availability with wireless technology that is license-free, open-standard,  and developed specifically for this type low power need application.  The hardware is easier to scale since the standard off-the-shelf packaging requires no customization thus saving development time and cost – a major development hurdle for most IoT applications

•	The customer base can be the hospital operator itself or 3rd parties such as equipment suppliers

•	2nd Generation Model -  Monitor, Control and Optimization service 

•	With built up industry-specific experience Blue Crew can offer a higher value optimization service where  equipment use is optimized for Key Performance Indicator goals such as improve revenue, reduce cost, improve quality of service based on historical movement algorithms of equipment and patients. 

•	With movement histories equipment the service can minimize equipment inventories by improving the efficient use, ensuring proper equipment maintenance and higher availability, switching in equipment with higher effectiveness, and removing redundant, underutilized equipment, and simply not buying unnecessary inventory.

•	Ultimately BlueCrew can supply equipment as a service where in conjunction with equipment supplier arrangements it provides hospitals with equipment on a non-capital equipment basis.

•	3rd Generation Model – Monitor, Control, Optimize, Autonomous service

•	With smarter beacons the service Blue Crew can integrate the service into other hospital systems such as accounting, facilities management, quality of service. 

•	The information of movement of equipment and patients can self-coordinate with other systems to improve performance and reduce cost.  The entire hospital can be coordinated as whole. For example management can respond effectively to demand response changes, such as large emergencies where pre-planned responses are automatically launched that involve all systems of the hospital from the operating room to public relations.

•	Possible parallel model enhancement

•	Provide similar services to other vertical market segments with similar characteristics. Service enhancements

•	Autonomous product enhancement and personalization

•	Self-diagnosis and service


##BLE The good and bad
####	Advantages

•	Relatively low power usage allows long battery life

•	Device has small footprint and volume and is off-the-shelf

•	Uses license-free, non-proprietary wireless technology

•	No coding cost for BLE beacon

•	Simpleness limits feature creep

•	Simple anonymous data set limits security issues

####	Limitations
•	Transmission limited to 30 meters

•	Requires 2nd layer of remote hardware

•	Location granularity – Algorithms need for under 30 meters

•	Installation cost and effort of 2nd layer may be prohibitive

##	Blue Crew Model

•	Asset monitoring as a service

•	Client base as facility operator or as 3rd party equipment supplier

•	Charge per beacon per month – monthly recurring revenue

•	Hardware free with 2 year commitment

##Service Capability

•	Initial Capability

•	Monitoring

•	Asset real time and historical location and movement

•	Real time asset mapping

•	Historical location reporting

•	Point in time

•	Historical movement

•	Next level capability

•	Control

•	Communication level app for human or machine follow-through

•	End-User portal interface

•	Add/Remove Beacons

•	Set up own organization reports – operational, accounting, executive, staff
Service Capability

•	3rd Level Capability – Optimization

•	With industry-specific experience can offer to optimize use of equipment to improve revenue, reduce cost, improve quality of service

•	Plan movement for best, highest use

•	Ensure high availability

•	Reduce need of additional equipment

•	4th Level Capability – Autonomy 

##Alternative Wireless Tech

•	Low Power Wide Area (LPWA) 

•	Device transmission measured in miles with low power needs with low data rates and longer latency

•	3.1 bn connections by 2023 – Machina Research

•	Non-Cellular Networks

•	Sigfox – 

•	Weightless

•	M2M Spectrum 

•	Nuel`

•	Nwave

•	Semtech

•	Senaptic

•	Cellular Networks

•	LTE-A 

##Impact on competition

•	1 How does the move to smart, connected products affect the structure of the industry and industry boundaries?

•	2 How do smart, connected products affect the configuration of the value chain or the set of activities required to compete?

•	3 What new types of strategic choices will smart, connected products require companies to make to achieve competitive advantage?

•	4 What are the organizational implications of embracing these new types of products and the challenges that affect implementation success?

	
##Mistakes to avoid

•	Adding functionality that customers don’t want to pay for.

•	Underestimating security and privacy risks.

•	Failing to anticipate new competitive threats.

•	Waiting too long to get started.






## Usage


The first application is IBM BlueMix Cloud List service. The application fork the Bluemix SDK. The mean purpose is upload the UUID of a BKon device to mobile data service on Bluemix automaticly.

Then the user can open the second application is main application. User can use that application to check every single BKon device.

The three main target:

First: design for nurse

Second: design for accounting man

Thrid: design for insurance company


### Installation:

Using CocoaPods:

1. Add `pod 'DropdownMenu'` to your Podfile.
2. Run `pod install`
3. Open the BKondemo.xcworkspace.




## License

The MIT License (MIT)

Copyright (c) 2013 Nils Mattisson, Martin Hartl

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


