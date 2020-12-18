# How to use Design System icons
We use a proprietary icon library, so, through an organized system, categories and names, we provide access to the icons supported by Nat Design System.

The icon library, which is available at [Natura Design System](https://zeroheight.com/28db352be/p/94367e-icon-library/b/6154b9) website, contains all the icons names and images. You can also check the icons by running the [Sample App](how-to-contribute.md) in a simulator.

## How to use
The icons are provided by the NatDS pod as the type `Icon`. They can be used as an `IconView` or inside a `NatIconButton`.

### View
To use an icon as an UIView, you can use the `IconView`. By default, it must use the size token `standard`; then you must provide the icon name as a parameter:
```swift
let iconView = IconView(fontSize: NatSizes.standard, icon: .outlinedActionLove)
```

### Button
To use an icon as a button, the `NatIconButton`component is the right choice. It's necessary to set a style (`default` or `primary`) and, then, to set the icon name as a parameter, as shown below:
```swift
let iconButton = NatIconButton(style: .standardDefault)
iconButton.configure(icon: .filledActionCheck)
```
