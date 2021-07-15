# Natura Design System for iOS

[![Build Status](https://app.bitrise.io/app/38848108b04aa71a/status.svg?token=KeP02isBtn73sdE7KEZO4w&branch=master)](https://app.bitrise.io/app/38848108b04aa71a)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/NatDS.svg)](https://img.shields.io/cocoapods/v/NatDS.svg)


## What for

Library with iOS components defined by [Natura Group Design System Team](https://natds.natura.design/docs).

## Tech Stack

- __Swift 5__
- Supports iOS __10__ to __14__
- CocoaPods
- Swift Package Manager
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

### Swift Package Manager
To use NatDS in your project with Swift Package Manager, you need to add it from the Xcode menu. First, you should follow the path `File > Swift Packages > Add Package Dependency` and then, provide it the git url for this repository. Xcode will manage the imports.

## How to configure
Before using the components, it's necessary to configure the Design System providing it with a brand theme or `fatalError` will be raised.

```swift
DesignSystem().configure(with: AvailableTheme)
```

## Icons
Since version `3.0.0` NatDS iOS no longer has the NatDS Icons. To use them, you MUST add a new pod to your project. You must specify it in your `Podfile`:

```ruby
target '<Your Target Name>' do
    pod 'NatDSIcons'    
end
```

### NatDSIcons versions
To check all available versions for NatDS Icons, you can check the [changelog](https://github.com/natura-cosmeticos/natds-commons/blob/master/packages/natds-icons/CHANGELOG.md) at the commons repository, or run a pod command from your terminal:

```bash
$ pod search NatDSIcons --simple
```

Don't forget to [check the documentation on how to use icons.](docs/How%20to%20use%20icons.md)

## Getting started
[Check how to start using our lib.](docs/Getting%20started.md)

## How to contribute

[Help us grow!](docs/How%20to%20contribute.md)
