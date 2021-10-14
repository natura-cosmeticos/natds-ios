# Getting Started - Nat Design System

## Themes
After following the steps to use NatDS with Cocoapods or Swift Package Manager in your project, it'ss necessary to configure the Design System with a theme or `fatalError` will be raised.

```swift
DesignSystem().configure(with: AvailableTheme)
```

Since every brand contained in the Design System has a different color palette and specific tokens, configuring the theme will define the base theme for the Design System usage and specify where the app should pull the token references from.

> It's recommended to set your chosen theme in the most generic layers of your app - in the `AppDelegate` file, for instance.

## Tokens

Design tokens are the most basic portion of our DS. They are all the basic attributes of design systems: colors, typography definitions, sizes, etc. Our library provide the following tokens:

- Border radius​
- Color​
- Elevation​
- Fonts
- [Icons](How%20to%20use%20icons.md)
- Opacity​
- Size​s
- Spacing​

The components available in the library are built using this tokens, which makes them visually consistent. In addition, you can also use the theme tokens directly in your project to create local team components and UIs.

Example:
If you need to add text to a view that will be styled with the following attributes:

```
Font Family: Roboto, sans-serif
Font Size: 96sp
Letter Spacing: 0.015625
Font weight: Regular
Lineheight: Medium (1.5)
```

You can set these attributes manually in your code or .xib, but you can also use the `Heading 1` typography token, that has exactly these attributes:

```swift
let myFont = NatFonts.font(ofSize: .heading1, withWeight: .regular)
```

Or if you need to build a view that has the brand primary color, you can use:

```swift
let myColor = NatColors.primary
```

## Components
Components are a collection of interface elements used to create great and consistent user experiences. The currently available components are listed in our [documentation](https://natds-ios.prd.naturacloud.com/documentation/index.html), with instructions and usage examples. 

You can also download this repository and run the Sample App, which has code examples for all available components, or check the general [Natura Group Design System documentation](https://natds.natura.design/docs).