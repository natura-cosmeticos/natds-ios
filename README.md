# Natura Design System for iOS

[![Build Status](https://travis-ci.org/natura-cosmeticos/natds-ios.svg)](https://travis-ci.org/natura-cosmeticos/natds-ios)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/NatDS.svg)](https://img.shields.io/cocoapods/v/NatDS.svg)

## What for
Library with iOS components defined by [Natura Group Design System Team](https://zeroheight.com/25ddaa7f8/p/07a27e).

## Installation

### Using CocoaPods

Add the following line to your Podfile:
```ruby
  pod 'NatDS'
```

## Sample
We have provided a sample project in the repository. To use it download the repo, run pod install to download the required libraries and open NatDS.xcworkspace. You'll see two schemes: NatDS and NatDS-SampleApp - select the NatDS-Sample and then build & run! Source files for these are in the NatDS-SamppleApp/Sources directory in project navigator.

## How to contribute
You can contribute submitting [pull requests](https://github.com/natura-cosmeticos/natds-ios/pulls).

### Prerequisites
For use this repository, you need to install:
- [Xcode 11+](https://developer.apple.com/xcode/)
- [Cocoapods](https://guides.cocoapods.org/using/getting-started.html)
- [Swiftlint](https://github.com/realm/SwiftLint)
- [Git-LFS](https://git-lfs.github.com/)

### Installing
- Clone the repo
- Run `pod install` to install the app dependencies

### Automated Tests
- We are using screenshot tests with [iOSSnapshotTestCase](https://github.com/uber/ios-snapshot-test-case) to validate our built components state, color and behavior.