Mobile Cloud Services iOS SDK for IBM Bluemix
===

This package contains the required native components to interact with the IBM
Bluemix Mobile Cloud Services.  The SDK manages all the communication and security integration between 
the client and with the Mobile Cloud Services in Bluemix.

When you use Bluemix to create a Mobile Cloud Starter application, BlueMix provisions 
multiple services under a single application context. Your mobile application is given 
access to the following mobile services: Mobile Application Security, Push, and Mobile Data.

Version: 1.0.0.20140707-1250

##Installation
The SDK may be installed either by downloading a [zip file](https://mbaas-catalog.ng.bluemix.net/sdk/ibm-baas-sdk-ios.zip),
or by installing desired frameworks from [CocoaPods](http://cocoapods.org/). Using CocoaPods 
can significantly shorten the startup time for new projects and lessen the burden of managing 
library version requirements as well as the dependencies between them.

To install CocoaPods, please see this link: http://guides.cocoapods.org/using/getting-started.html#getting-started.  If you
are using one of our [samples](https://hub.jazz.net/user/mobilecloud),
a [pod](http://guides.cocoapods.org/using/the-podfile.html)
file has been included for you.

###Contents
The complete SDK consists of a core, plus a collection of pods that correspond to function exposed
by the Mobile Cloud Services.  The downloaded zip file
contains all of them. However, each piece of the iOS SDK is also available as a separate pod
through CocoaPods, 
that you can add to your project individually. This allows maximum flexibility, as the developer is able to 
pick and choose the pods required for a given application. The iOS SDK contains the following 
pods, any of which may be added to your project.

The list of components is as follows:
- **[ibmbluemix](https://hub.jazz.net/project/bluemixmobilesdk/ibmbluemix-ios/overview)** - This is the foundation of the SDK and controls connection and communication with Backend services
- **[ibmpush](https://hub.jazz.net/project/bluemixmobilesdk/ibmpush-ios/overview)** - This is the service SDK for push notification support
- **[ibmdata](https://hub.jazz.net/project/bluemixmobilesdk/ibmdata-ios/overview)** - This is the service SDK for cloud data storage
- **[ibmfilesync](https://hub.jazz.net/project/bluemixmobilesdk/ibmfilesync-ios/overview)** - This is the service SDK for cloud file storage
- **[ibmcloudcode](https://hub.jazz.net/project/bluemixmobilesdk/ibmcloudcode-ios/overview)** - This is the service SDK for cloud code invocation
- **[ibmlocation](https://hub.jazz.net/project/bluemixmobilesdk/ibmlocation-ios/overview)** - This is the service SDK for the Beta level mobile location services
- **docs/** - This directory contains the documentation for the SDK

###Supported iOS Levels
- iOS 5.1.1
- iOS 6
- iOS 6.1
- iOS 7
- iOS 7.1

##Getting Started:
Services are associated with a Mobile Cloud application. Connectivity and interaction with
these services depends on the application id, application secret, and application route associated
with a Mobile Cloud Application.

IBMBluemix is the entry point for interacting with the Mobile Cloud Services SDKs.  The method initialize 
must be invoked before any other API calls.  IBMBluemix provides information about the current SDK level 
and access to service SDKs.

Below is an example of initializing the Mobile Cloud Services SDK.
```objective-c
[IBMBluemix initializeWithApplicationId: applicationId andApplicationSecret: applicationSecret andApplicationRoute: applicationRoute];
[IBMCloudCode initializeService];
[IBMData initializeService];
[IBMPush initializeService];
```
##Learning More
To learn more about using the SDK, please consult the following resources:
- **[Mobile Cloud Services SDK Developer Guide](http://mbaas-gettingstarted.ng.bluemix.net/)**
- **[Samples and Tutorials](https://www.ng.bluemix.net/docs/#starters/mobile/index.html#samples)**
- Visit the **[Bluemix Developers Community](https://developer.ibm.com/bluemix/)**

Connect with Bluemix: [Twitter](https://twitter.com/ibmbluemix) |
[YouTube](https://www.youtube.com/playlist?list=PLzpeuWUENMK2d3L5qCITo2GQEt-7r0oqm) |
[Blog](https://developer.ibm.com/bluemix/blog/) |
[Facebook](https://www.facebook.com/ibmbluemix) |
[Meetup](http://www.meetup.com/bluemix/)

*Licensed Materials - Property of IBM
(C) Copyright IBM Corp. 2013, 2014. All Rights Reserved.
US Government Users Restricted Rights - Use, duplication or
disclosure restricted by GSA ADP Schedule Contract with IBM Corp.*

[Terms of Use](https://hub.jazz.net/project/bluemixmobilesdk/ibmbluemix-android/overview#https://hub.jazz.net/gerrit/plugins/gerritfs/contents/bluemixmobilesdk%252Fibmbluemix-android/refs%252Fheads%252Fmaster/License.txt) |
[Notices]() | Bolts Terms of Use | Bolts Patents