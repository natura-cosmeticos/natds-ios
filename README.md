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

## Icons
Since version `3.0.0` NatDS iOS has no longer NatDS Icons. To use NatDS Icons, you MUST add a new pod to your project. You must specify it in your `Podfile`:

```ruby
target '<Your Target Name>' do
    pod 'NatDSIcons'    
end
```

[Check the documentation on how to use icons.](docs/How%20to%20use%20icons.md)

## Getting started
[Check how to start using our lib.](docs/Getting%20started.md)

## How to contribute

[Help us grow!](docs/How%20to%20contribute.md)
