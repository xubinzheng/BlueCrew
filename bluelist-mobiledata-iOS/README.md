Sample: bluelist-mobiledata-iOS
===

The bluelist-mobiledata-iOS sample builds upon the bluelist-base-iOS sample, a simple grocery list application.  In bluelist-mobiledata-iOS, the items persist to a mobile backend, using the Mobile Data service.

This sample works with the Mobile Cloud, an application boilerplate that is available on [IBM Bluemix](https://www.ng.bluemix.net).  With this boilerplate, you can quickly incorporate pre-built, managed, and scalable cloud services into your mobile applications without relying on IT involvement. You can focus on building your mobile applications rather than the complexities of managing the back end infrastructure.

This sample uses the Mobile Data Service that is a part of the Mobile Cloud boilerplate.  After you run the sample and add some items to the list, you can see your data persisted to the cloud.

Creating the Mobile Cloud boilerplate application
---
1. Login to [IBM Bluemix](https://www.bluemix.net)
2. Click 'Catalog' or 'Create An App'
3. Under Boilerplates, select Mobile Cloud.
4. Enter in App Info & select 'Create'
5. You now have a mobile cloud backend, providing you with some mobile services on the cloud!

Downloading the samples
---
You can clone the samples from IBM DevOps Services with the following command:

    git clone https://hub.jazz.net/git/mobilecloud/bluelist-mobiledata

The bluelist-mobiledata-iOS sample will be located within the bluelist-mobiledata directory you just created.

Downloading the Dependencies
---

You can now download the dependencies for this sample using cocoapods!
This will enable you to skip the SDK download instructions in the article below.

First, install CocoaPods using the following command:

      sudo gem install cocoapods

Next, go to the folder containing the bluelist-mobiledata-iOS sample.  Then, install the
dependencies listed in your podfile using the following command:

      pod install

Keep in mind that when using cocoapods, you must use the app's .xcworkspace file, and not
the .xcodeproj file.  This file will be generated on pod install.


Running this iOS sample (bluelist-mobiledata-iOS)
---

You may now open the project's .xcworkspace file (if using cocoapods), and get started!

See the instructions in [Build an iOS app using the Mobile Data cloud service](http://www.ibm.com/developerworks/library/mo-ios-mobiledata-app/index.html) for more information about how to import this sample into your Xcode development environment and run the sample in a mobile emulator.
Note: If you've installed dependencies using cocoapods, you may skip steps: 1.7-1.9
