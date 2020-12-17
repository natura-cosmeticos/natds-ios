# Natura Design System for iOS

[![Build Status](https://app.bitrise.io/app/38848108b04aa71a/status.svg?token=KeP02isBtn73sdE7KEZO4w&branch=master)](https://app.bitrise.io/app/38848108b04aa71a)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/NatDS.svg)](https://img.shields.io/cocoapods/v/NatDS.svg)


## What for

Library with iOS components defined by [Natura Group Design System Team](https://natds.natura.design/docs).

## Tech Stack

- __Swift 5__
- Supports iOS __10__ to __14__
- CocoaPods
- Fastlane
- Bitrise (CI)
- [Git-LFS](https://git-lfs.github.com/)
- Swiftlint
- [Jazzy](https://github.com/realm/jazzy) for documentation

## How to Install

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate NatDS into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
target '<Your Target Name>' do
    pod 'NatDS'
end
```

Then, run the following command:

```bash
$ pod install
```

Before start using, it's necessary to configure the Design System with a theme or fatalError will be raised.

```swift
DesignSystem().configure(with: AvailableTheme)
```

## Getting started

[Check how to start using our lib](docs/Getting-started.md).



## How to contribute

[Help us grow!](docs/How-to-contribute.md)
