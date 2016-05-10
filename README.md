**NewsAppSwiftMVVM** is an example app exploring ReactiveCocoa 4, MVVM, Swift 2.

NOTE: This is work in progress.

## Setup

The app uses CocoaPods for handling third-party dependencies. To build the app, simply clone the repository and then run ``pod install``.

## Version

- 1.2: A lot has been refactored, and a lot of protocols and protocol extensions has been added. Watch app should now work without the phone.
- 1.1:　Apple Watch support using watchOS 2.
- 1.0: Initial version. Supports RAC 4 and Swift 2.


## User Features

- [ ] View list of articles
- [ ] Pull-to-refresh any list in the app
- [ ] Get alerts about network and server errors
- [ ] Enjoy custom fonts and colors
- [ ] See animated list changes

## Code Checklist

- [ ] Move base URL to Settings for easy customization
- [ ] Cancel network requests when the associated view becomes inactive
- [ ] Write tests for models
- [ ] Write tests for view models
- [ ] Write tests for helpers and store
- [ ] Make backend in Swift and move to this repo.

## Useful resources

### sample for MVP

- [katleta3000/MVVM_lesson: Project for MVVM webinar](https://github.com/katleta3000/MVVM_lesson)

### sample for refactoring

- [ColinEberhardt/ReactiveTwitterSearch: A ReactiveCocoa 4.0 MVVM example](https://github.com/ColinEberhardt/ReactiveTwitterSearch)
- [TodaysReactiveMenu](https://github.com/s0mmer/TodaysReactiveMenu/blob/develop/README.md)
- [SwiftGoal](https://github.com/richeterre/SwiftGoal)

## Screenshots

![20160111_23_35](https://cloud.githubusercontent.com/assets/901084/12236377/b2c84b28-b8bc-11e5-815f-863fdc4f687a.gif)

