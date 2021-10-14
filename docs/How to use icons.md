# How to use Design System icons
We use a proprietary icon library, which means that we provide access to the icons supported by Natura Design System through an organized system, categories and names.

The icon library, which is available at [Natura Design System](https://ds.natura.design/28db352be/p/94367e-icon-library/b/6154b9) website, contains all the icons names and images. You can also check the icons by running the [Sample App](how%20to%20contribute.md) in a simulator.

## Getting started
Since version `3.0.0`, the icons are provided by the NatDSIcons library, available at [Cocoapods](https://cocoapods.org/pods/NatDSIcons). It means that you have to add NatDSIcons on your `Podfile`:

```ruby
target '<Your Target Name>' do
    pod 'NatDSIcons'
end
```

And import NatDSIcons on the files that use icons:

```swift
import NatDSIcons
```

With NatDSIcons, all icon options from the library are listed as Icon type options. To use them, you must use the function `getIcon(_ icon: Icon) -> String`, sending the chosen icon name as a parameter. 

```swift
let icon = getIcon(.outlinedActionCancel)
```

> NOTE: As the icons are provided by NatDSIcons as strings, you MUST use it with NatDS to show the actual icon.

---

## How to use icons with NatDS
When NatDS components expect an icon, the icon parameter is sent as a `String` type. To use the icons with NatDS components, you can send the `getIcon(_ icon: Icon) -> String` function as a parameter.

Example of usage with a component:

```swift
let button = NatButton()
button.configure(getIcon(.outlinedAlertNotification), position: .left)
```

---

## How to use an icon as an UIView
To use an icon as an `UIView`, you can use the `IconView`. By default, it must use the size token `standard`; then you must provide the icon name as a parameter:

```swift
let iconView = IconView(fontSize: NatSizes.standard, icon: getIcon(.outlinedAlertNotification))
```
