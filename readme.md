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


