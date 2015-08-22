# watchOS-2-Sampler

Code examples for new features of watchOS 2.


##Requirements

- Xcode 7.0, iOS 9.0 SDK, watchOS 2.0 SDK
- iOS 9.0 and watchOS 2.0


##How to build

- Change the "Team" setting on [General] for each target.
- Setup **HealthKit** for the WatchKit extension target.
- Setup **App Groups** for the parent app and extension.
  - Edit "AudioRecAndPlayInterfaceController" with your group identifier.

##Contents

**[note]**  ScreenShots will be available after the official release of watchOS 2 because of NDA. Some images are picked from WWDC session videos which are publicly opened by Apple.

###Accelerometer

Access to Accelerometer data using CoreMotion.

###Gyroscope (Not Available)

Access to Gyroscope data using CoreMotion. 

**These APIs are available, however CMMotionManager always returns `false` for `gyroAvailable`. So actually it's not available for now.**


###Device Motion (Not Available)

Access to DeviceMotion data using CoreMotion. 

**These APIs are available, however CMMotionManager always returns `false` for `deviceMotionAvailable`. So actually it's not available for now.**


###Pedometer

Counting steps demo using CMPedometer.

###Heart Rate

Access to Heart Rate data using HealthKit.

###Table Animations

Insert and remove animations for WKInterfaceTable.

###Animated Properties

Animate width/height and alignments.

###Draw Paths (Updated by [hoppenichu](https://github.com/hoppenichu))

Draw paths with Core Graphics.

###Gradations (Updated by [hoppenichu](https://github.com/hoppenichu))

Draw gradations with Core Graphics.


###Audio Rec & Play

Record and play audio.

<img src="ResourcesForREADME/recorder.jpg">

###Picker Styles

WKInterfacePicker styles catalog.

###Taptic Engine

Access to the Taptic engine using playHaptic method.

###Alert

Present an alert or action sheet.

###Animation with Digital Crown

Coordinated Animations with WKInterfacePicker and Digital Crown.

###Interactive Messaging

Sending message to phone and receiving from phone demo with WatchConnectivity.

###Open System URL

Open Tel or SMS app using openSystemURL: method.

###Audio File Player

Play an audio file with WKAudioFilePlayer.

###Network Access (Created by [KAMEDAkyosuke](https://github.com/KAMEDAkyosuke))

Get an image data from network using NSURLSession.


##Known Issues

- Heart Rate
  - Under development
- Open System URL
  - Phone doesn't launch...
  - It's based on the Apple's document. 
  - `sms:` works with same way. I have no idea why it doesn't work!

##Author

Shuichi Tsutsumi

- [Twitter](https://twitter.com/shu223)
- [Facebook](https://www.facebook.com/shuichi.tsutsumi)
- [LinkedIn](https://www.linkedin.com/profile/view?id=214896557)
- [Blog (Japanese)](http://d.hatena.ne.jp/shu223/)


##Special Thanks

Icons are **designed by [Okazu](https://www.facebook.com/pashimo)**
