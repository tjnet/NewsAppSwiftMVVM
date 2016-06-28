**NewsAppSwiftMVVM** is an example app exploring RxSwift, MVVM, Swift 2.

NOTE: This is work in progress.

## Screenshots

![20160111_23_35](https://cloud.githubusercontent.com/assets/901084/12236377/b2c84b28-b8bc-11e5-815f-863fdc4f687a.gif)

## Setup

The app uses CocoaPods for handling third-party dependencies. To build the app, simply clone the repository and then run ``pod install``.

## Version

- 1.2: A lot has been refactored, and a lot of protocols and protocol extensions has been added. Watch app should now work without the phone.
- 1.1:　Apple Watch support using watchOS 2.
- 1.0: Initial version. Supports Xcode7.3+ and Swift 2.


## User Features

- [x] View list of articles
- [ ] Pull-to-refresh any list in the app
- [ ] Get alerts about network and server errors
- [ ] Enjoy custom fonts and colors
- [ ] See animated list changes

## Code Checklist

- [ ] Move base URL to Settings for easy customization
- [ ] Cancel network requests when the associated view becomes inactive
- [x] Write tests for models
- [x] Write tests for view models
- [ ] Write tests for helpers and store
- [x] Write models
- [x] Write view models
- [x] Write tableviewcell
- [x] Write viewcontrollers
- [ ] Make backend in Swift and move to this repo.

## Useful resources

### sample for MVP

- [RxSwift/RxExample/RxExample/Examples/WikipediaImageSearch at master · ReactiveX/RxSwift](https://github.com/ReactiveX/RxSwift/tree/master/RxExample/RxExample/Examples/WikipediaImageSearch) original
- [mafmoff/RxDriveRSSFeed](https://github.com/mafmoff/RxDriveRSSFeed)
- [marinbenc/ReactiveWeatherExample: A simple iOS weather app using the MVVM pattern and RxSwift framework.](https://github.com/marinbenc/ReactiveWeatherExample)
- [PiXeL16/SwiftTMDB: A sample movie app that I build to play with Swift, Alamofire, Moya, RxViewModel, RxSwift, etc](https://github.com/PiXeL16/SwiftTMDB)
- [katleta3000/MVVM_lesson: Project for MVVM webinar](https://github.com/katleta3000/MVVM_lesson) Basic
- [rickyngk/swift-mvvm: Swift MVVM sample](https://github.com/rickyngk/swift-mvvm) RxSwift

### sample for refactoring

- [ColinEberhardt/ReactiveTwitterSearch: A ReactiveCocoa 4.0 MVVM example](https://github.com/ColinEberhardt/ReactiveTwitterSearch)
- [TodaysReactiveMenu](https://github.com/s0mmer/TodaysReactiveMenu/blob/develop/README.md)
- [SwiftGoal](https://github.com/richeterre/SwiftGoal)

### sample for testing(XCTest)

- [rickyngk/swift-mvvm: Swift MVVM sample](https://github.com/rickyngk/swift-mvvm)


