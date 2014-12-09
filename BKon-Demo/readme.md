# BlueCrew

###High-Value Asset Tracking using Bluetooth Low Energy Beacon

There are application video in Gif file


<img src="https://raw.githubusercontent.com/xubinzheng/BlueCrew/master/Gif/BKondemo.gif"/>



#IBM IoT Design Challenge Application Team Blue Crew

##Team Members:

Xubin “Jasper “ Zheng (Captain) - 9193604673 - zhengx@live.unc.edu

Zhilan Zhou - 9194485716 - zzl@live.unc.edu

Brea Dionisio – 9199048309 - dionisio@live.unc.edu

Manuel Zepeda – 9193495736 - Manuel.Zepeda@live.com




##Application:
High-Value Asset Tracking using Bluetooth Low Energy Beacon

##Solving: 
Tracking assets in a hospital environment where the location history of all patients and important assets are
monitored and stored in order to lower costs and improve quality of patient care

##Type: 
IOS
￼￼

##Introduction

Our application has two separate parts.

The first part is a remote device communication component. This is built on IBM Bluemix mobile SDK and on the BKON SDK. This application checks and uploads the location of a Bluetooth Low Energy (BLE) iBeacon, in our case a BKON A1 or D1 device, within a 30m circle.

The second is a user interface part called BKON-demo. 

The application mainly provides three functions.

####Location
Enter the UUID of asset’s nickname to locate. The user names any registered BKON device on the BKON SDK, so that she can also use the device name as a key word; click Locate, the function will return a build structure map to locate the asset. As shown there, the receiver No.1 was placed in the lobby, and the information of a BKON device also including the distance from device to receiver, so we can say the asset was located in x meters range of the receiver. If more than 2 receivers got the signal from a BKON device, we will use triangulation location to return a specific location.

####Time Stamp (implied movement)
The user to enter the UUID of asset’s nickname, and chooses a start date from which to begin monitoring for location and movement within a facility user want to know from that timing point to now, how many times of that asset has been moved. We check this by monitoring the distance has changed between the asset and receiver, or we check if the receiver has lost this asset’s signal or receives a new signal of this device. Our plan is to create ability for user to set up and receive reports that list where each asset has been over a given period of time. For “check more details” we planning this can return a list that shown where this asset has been.

####Inventory Check
The user can create a report form or upload an Excel file to determine which assets and patients are accounted in real time or for a given time.
For this part, user needs to upload an Excel file or type several UUIDs to our application. This function will just return if the signals of assets can be found.



##Application Architecture

<img src="https://raw.githubusercontent.com/xubinzheng/BlueCrew/master/Gif/loop.png"/>

The first application is running 24/7 and no need of extra memory to run the application because every single receiver can upload the data to cloud (IBM Bluemix mobile data service) automatically.
No need of extra space to save data on any device (mobile phone). Every time if a customer want to search a asset, out application just go to the Bluemix mobile data service to visit that data
Any computing and logical part will be finished on cloud.
User can import an EXCEL file of asset list from cloud service to our application


##Application Platform
Any single user interface will not save the data of a BKON, so no more extra memory or storage is needed in our application, because the computation will be done on cloud service and we build the algorithm part on Bluemix that can run 24/7. The application can visit the data anytime anywhere, so need to uninstall other applications.
The three different is designed for three main types of user. Like in a hospital environment, for example:

####Location
Nurse, the application returns a location of a valuable tool’s location then nurse can easily find it. No wasting time on looking for a tool can possibly save more lives.
####Movement
Manager, the application returns if the asset has been moved so much. If it is, then might be hospital manager show buy some new tools for emergence.(I mean like both two surgeries need a one tools then they have to wait the first surgery is finished)
####Inventory Check
ccount man, the application returns a check list for user, then he or she can easily how if some valuable asset has been lost or stolen. In this situation, if an important surgery tool is missed, they can buy a new one as soon as possible.



##Asset/Patient Device Networks

There are two device layers at the hospital facilities. The 1st layer is the Bluetooth Low Energy (BLE) beacons (BKON A1) attached to assets such as equipment or other physical hardware, and to patients.

####1st Layer Device – Location/Gateway

BLE beacons solely communicate their serial number (i.e. unique identifier). The unique characteristics of the serial number are maintained at the application platform.

Some attractive advantages of the BLE beacons are:

• Long battery life. We expect the beacon hardware to stay in the field for a year or two.

• Relatively small, off-the-shelf devices, thus eliminating hardware development costs

• The intrinsic nature of a BLE beacon means no customized software development

• The limited transmitting distance narrows down the location area.

####2nd Layer Device – Location/Gateway
This device communicates with local BLE beacons, maintains its own location & time information and BLE beacons within its physical field. The device also communicates the beacon name, location, and time to the application platform via a local gateway or directly to a wide area connectivity network.

Some advantages of the location/gateway device are:

• Uses off-the-shelf communication components – BLE, Wif-Fi, ZigBee, etc.

• Use off-the-shelf microcontroller component

• Lightweight client software since local processing needs are simple

• Application has low bandwidth requirement so those applicable technologies are used






##Overview:
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






##Business Model

The key aspect of the model is to leverage the flexibility of the application platform and the simplicity of the BLE beacons and of oncoming near-term Low Power Wide Area (LPWA) technology networks and devices. Use a simple data point - the location of a given beacon at a given point in time -and leverage for maximum value at the application platform level. The benefits to the customer would focus on reducing costs, capital expenditures, improving quality of patient care, reduce insurance costs. In short permit the hospital to focus its staff on what it does best, attending to provide the best patient care possible.


####Initial Model – Monitoring and control service
Blue Crew’s initial IoT application business model is hospital asset and patient location and movement history information as a service. Blue Crew will generate monthly recurring revenue from each beacon point monitored by the service.

Through a customer portal one can monitor the current location of assets as well as generate reports for location of assets at a given time or for the movement of equipment and patients over a given time. Customer can add or remove beacons via the portal and can create asset and patient groups and hierarchies. Via the portal one can create event types and how to flag these.

Different parts of the hospital organization can generate its own relevant custom reports. For example hospital operational staff such as nurses and maintenance can find current location of specific equipment; accounting staff can generate an inventory reports; staff can query the current location of patients; executive management can generate reports determining effective usage of equipment based on movement over time.

The Bluetooth Low Energy (BLE) beacons enable the service platform to effectively monitor and report due to their long life battery capability, small size, low cost, off-the-shelf availability with wireless technology that is license-free, open-standard, and developed specifically for this type low power need application. The hardware is easier to scale since the standard off-the-shelf packaging requires no customization thus saving development time and cost – a major development hurdle for most IoT applications

The customer base can be the hospital operator itself or 3rd parties such as equipment suppliers



####2nd Generation Model - Monitor, Control and Optimization service

With built up industry-specific experience Blue Crew can offer a higher value optimization service where equipment use is optimized for Key Performance Indicator goals such as, reducing cost, improving quality of service, improving revenue based on historical movement algorithms of equipment and patients.

With movement histories the service can likely minimize equipment inventories by improving their efficient use, proper equipment maintenance and higher availability, switching in equipment with higher effectiveness, and removing redundant, underutilized equipment, and simply not buying unnecessary inventory.

Ultimately Blue Crew can supply equipment as a service where in conjunction with equipment supplier arrangements it provides hospitals with equipment on a non-capital equipment basis.


####3rd Generation Model – Monitor, Control, Optimize, Autonomize service

With smarter beacons Blue Crew can integrate the service into other hospital systems such as accounting, facilities management, quality of service.

The information of movement of equipment and patients can self-coordinate with other systems to improve performance and reduce cost. The entire hospital can be coordinated as whole. For example management can respond effectively to demand response changes, such as large emergencies where pre-planned responses are automatically launched that involve all systems of the hospital from the operating room to public relations.


###Possible parallel model enhancement


Provide services to other vertical market segments with similar characteristics.


####Business Model Issues

By focusing on the benefits to the hospital this service application will more likely succed. Some hospital acceptance concerns could be:

• HIPAA Compliance concerns

• Physical plant concerns

• Getting buy-in from multiple groups across the organization

• Possible perceived increased complexity to staff environment

• Always cost – capital and operational

• Patient acceptance

• Possible security concerns


####Business development approach to hospitals

• Partner with vendor suppliers to offer “complete solutions”

• Focus on making on-site presence as lightweight and unobtrusive as possilble

• Tie service tightly to direct cost benefits and to patient quality of care

• Understand prime concerns of key decision makers

• 2nd layer hardware

• Make as lightweight as possible

• Lowest cost hardware

• Simple to install

• Require little to no interaction with local resources

• Data network integration

• Physical modifications

• Involvement of multiple organization groups

• Security hurdles







##BLE - the good and the limited
####	Advantages

• Relatively low power usage allows long battery life

• Device has small footprint and volume and is off-the-shelf

• Lowish cost

• Uses license-free, non-proprietary wireless technology

• No coding cost for BLE beacon

• Simpleness limits feature creep

• Simple anonymous data set limits security issues

• Good technology for the short term – good now better than perfect later


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




##Alternative Wireless Technologies for use on physical facilities

RFID, proprietary wireless technologies, ZigBee (IEEE 802.15.4), mesh networks

On the horizon are new wide area network technologies focusing on long distance wireless communication for low bandwidth, wide area applications. The commonly used term is Low Power Wide Area (LPWA). Machina Research predicts 3.1 billion LPWA connections by 2023.

With these LPWA technologies device transmission distance is measured in miles with low power needs for applications with low data rates tolerating non-real-time latency

There are now many non-cellular network and device initiatives, such as Sigfox,Weightless, 2M Spectrum ,Nuel, Nwave, Semtech, Senaptic

A cellular network alternative is LTE-A. The development of 5G LTE network is now incorporating Internet of Things needs, including low power needs for battery life applications. A majority of IoT applications need only 2G type data bandwidth access.






### Installation:

Using CocoaPods:

1. Add `pod 'DropdownMenu'` to your Podfile.
2. Run `pod install`
3. Open the BKondemo.xcworkspace.




## License

The MIT License (MIT)

Copyright (c) 2014 Xubin Zheng

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


