# Getting Started - Nat Design System

## Themes
After following the steps to use NatDS with Cocoapods in your project, its necessary to configure the Design System with a theme or `fatalError` will be raised.

```swift
DesignSystem().configure(with: AvailableTheme)
```

Since every brand contained in the Design System (DS) has a color palette, configuring the theme will define the base theme for the usage of the Design System (DS) and specify from where the app should pull the color references to itself.

We recommend you to the DS theme to the most generic layers of your app - in the `AppDelegate` file, for instance.

## Design Tokens

Design tokens are the most basic portion of our DS. They are all the basic attributes of design systems: colors, typography definitions, sizes, etc. Our library provide the following tokens:

- Border radius​
- Color​
- Elevation​
- Fonts
- [Icons](How%20to%20use%20icons.md)
- Opacity​
- Size​s
- Spacing​

And how can this be used by applications? First of all, it is worth remembering that the components made available by DS are built from these tokens. In addition, you can explore our tokens to define your screens and components.

For example: you need to add text to a view that will be styled with the following attributes:

```Font Family: Roboto, sans-serif
Font Size: 96sp
Letter Spacing: 0.015625
Font weight: Regular
Lineheight: Medium (1.5)
````

You can set these attributes manually in your code or .xib, or you can use the `Heading 1` typography token, that has exactly these attributes:

```swift
NatFonts.font(ofSize: .heading1, withWeight: .regular)
```

## Components
Components are a collection of interface elements used to create great and consistent user experiences. The currently available components are listed in our [documentation](https://natds-ios.prd.naturacloud.com/documentation/index.html), with instructions and usage examples.