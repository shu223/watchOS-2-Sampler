# watchOS-2-Sampler

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)

Code examples for new features of watchOS 2.


<img src="ResourcesForREADME/watchos2sampler.jpg" width="242">

##Requirements

- Xcode 7
- iOS 9 and watchOS 2


##How to build

- Change the "Team" setting on [General] for each target.
- Enable **HealthKit** for the parent app and WatchKit extension target.
- Enable **App Groups** for the Watch app and WatchKit extension target.
  - Edit "AudioRecAndPlayInterfaceController" with your group identifier.
- Build & Run with **Xcode 7**


##Contents

###Animated Properties

Animate width/height, alpha and alignments.

![](ResourcesForREADME/animation.gif)


###Table Animations

Insert and remove animations for WKInterfaceTable.

![](ResourcesForREADME/tableanim.gif)


###Picker Styles

WKInterfacePicker styles catalog.

<img src="ResourcesForREADME/picker.png" width="136">


###Taptic Engine

Access to the Taptic engine using `playHaptic` method.

<img src="ResourcesForREADME/taptic.png" width="136">


###Audio Rec & Play

Record and play audio.

<img src="ResourcesForREADME/rec_play.png" width="275">


###Animation with Digital Crown

Coordinated Animations with WKInterfacePicker and Digital Crown.

![](ResourcesForREADME/crownanim.gif)


###Draw Paths (Updated by [hoppenichu](https://github.com/hoppenichu))

Draw paths with Core Graphics.

<img src="ResourcesForREADME/bezier.png" width="136">


###Gradations (Updated by [hoppenichu](https://github.com/hoppenichu))

Draw gradations with Core Graphics.

<img src="ResourcesForREADME/gradation.png" width="136">


###Heart Rate (Created by [kitasuke](https://github.com/kitasuke))

Access to Heart Rate data using HealthKit.

<img src="ResourcesForREADME/heartrate.png" width="136">


###Accelerometer

Access to Accelerometer data using CoreMotion.

<img src="ResourcesForREADME/acc.png" width="136">

###Gyroscope (Not Available)

Access to Gyroscope data using CoreMotion. 

**These APIs are available, however CMMotionManager always returns `false` for `gyroAvailable`. So actually it's not available for now.**

<img src="ResourcesForREADME/gyro.png" width="136">

###Device Motion (Not Available)

Access to DeviceMotion data using CoreMotion. 

**These APIs are available, however CMMotionManager always returns `false` for `deviceMotionAvailable`. So actually it's not available for now.**

<img src="ResourcesForREADME/devmotion.png" width="136">

###Pedometer

Counting steps demo using CMPedometer.

<img src="ResourcesForREADME/pedometer.png" width="136">

###Alert

Present an alert or action sheet.

<img src="ResourcesForREADME/alert.png" width="414">


###Interactive Messaging

Sending message to phone and receiving from phone demo with WatchConnectivity.

<img src="ResourcesForREADME/interactive.png" width="136">


###Audio File Player

Play an audio file with WKAudioFilePlayer.

<img src="ResourcesForREADME/audiofile.png" width="136">

**Need to pair a Bluetooth headset on your Apple Watch.**

###Open System URL

Open Tel or SMS app using openSystemURL: method.

<img src="ResourcesForREADME/open.png" width="136">


###Network Access (Created by [KAMEDAkyosuke](https://github.com/KAMEDAkyosuke))

Get an image data from network using NSURLSession.

<img src="ResourcesForREADME/network.png" width="136">


##Known Issues

- Open System URL
  - Phone doesn't launch...
  - It's based on the Apple's document. 
  - `sms:` works with same way. I have no idea why it doesn't work!


##iOS-9-Sampler

You can check the **examples for iOS 9** new features on [iOS-9-Sampler](https://github.com/shu223/iOS-9-Sampler)!!

<a href="https://github.com/shu223/iOS-9-Sampler"><img src="https://github.com/shu223/iOS-9-Sampler/blob/master/ResourcesForREADME/uistackview.gif?raw=true"></a>

- https://github.com/shu223/iOS-9-Sampler


##Author

**Shuichi Tsutsumi** (Freelance iOS engineer)

- [Twitter](https://twitter.com/shu223)
- [Facebook](https://www.facebook.com/shuichi.tsutsumi)
- [LinkedIn](https://www.linkedin.com/profile/view?id=214896557)
- [Blog (Japanese)](http://d.hatena.ne.jp/shu223/)


##Special Thanks

The icon is designed by [Okazu](https://www.facebook.com/pashimo).
