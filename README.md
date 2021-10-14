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
- Swiftlint
- [Jazzy](https://github.com/realm/jazzy) for documentation

## How to Install

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift and Objective-C Cocoa projects. You can install it with the following command:

```bash
gem install cocoapods
```

> You can also check Cocoapods' [installation guide](https://guides.cocoapods.org/using/getting-started.html#installation) for other options.

To integrate NatDS into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
target '<Your Target Name>' do
    pod 'NatDS'
end
```

Then, run the following command:

```bash
pod install
```

### Swift Package Manager
To use NatDS in your project with Swift Package Manager, you need to add it from the Xcode menu.
Follow the path `File > Swift Packages > Add Package Dependency` and then provide it the git url for this repository: `https://github.com/natura-cosmeticos/natds-ios.git`. Xcode will manage the imports.

## How to configure
The library provide the components according to the Design System brand themes, which must be chosen before using the components (usually, at your app's launch). All themes available are options in the `AvailableTheme` enum.

To choose a theme, configure the library with the following code:

```swift
DesignSystem().configure(with: AvailableTheme)
```

> Reminder: This step is mandatory. If the Design System is not configured with a brand theme, a `fatalError` will be raised. 

## How to add icons
This library does not have the Design System icons. Since version `3.0.0`, they're stored in the separate icon library [NatDSIcons](https://cocoapods.org/pods/NatDSIcons), which can also be used with Cocoapods.

To use the icons, specify their pod in your `Podfile`:

```ruby
target '<Your Target Name>' do
    pod 'NatDSIcons'    
end
```

> If you're using a NatDS version older than `3.0.0` there are available icons in the library. Nonetheless, some newer icons won't be available.
### NatDSIcons versions
To check all available versions for NatDS Icons, you can check the [changelog](https://github.com/natura-cosmeticos/natds-commons/blob/master/packages/natds-icons/CHANGELOG.md), or run a pod command from your terminal:

```bash
pod search NatDSIcons --simple
```

[Check the documentation on how to use icons in your code.](docs/How%20to%20use%20icons.md)

## Themes, Components and Tokens
[Check how to use the library.](docs/Getting%20started.md)

## How to contribute
[Check the contribution guidelines.](docs/How%20to%20contribute.md)
