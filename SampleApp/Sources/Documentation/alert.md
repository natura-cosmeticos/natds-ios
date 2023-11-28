# Alert

### Difference of Snackbar and Alert

#### Alert
Alert is an element within the context of the page (like a disclaimer, a highlighted information box) without interaction.

#### Snackbar
The Snackbar is something temporary about the content of the page (like a notification) that can have the action of dismiss, or a CTA.

<br>


## Properties

| Property           | Values                         | Status            |
| --------------     | -------------------------      | ----------------- |
| Title             | True, False                          | ✅  Available     |
| Icon          | True, False   | ✅  Available     |
| Type         | Contained, Outlined       | ✅  Available     |
| Color          | Success, Warning, Info, Error, Custom                    | ✅  Available     |

<br>

## Technical Usages Examples
> All codes are available for iOS with Swift.

<br>

<p align="center">
  <img alt="Alert 1" src="./images/alert_1.png" width="22%"> 
&nbsp; &nbsp; &nbsp; 
  <img alt="Alet 2" src="./images/alert_2.png" width="22%">
&nbsp; &nbsp; &nbsp; 
  <img alt="Alert 3" src="./images/alert_3.png" width="22%">
 &nbsp; &nbsp;&nbsp; 
    <img alt="Alert 3" src="./images/alert_4.png" width="22%">
</p>

<br>

```swift
private let alert: NatAlert = {
    let alert = NatAlert(style: .warning)
    alert.configure(titleText: "Title example")
    alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
        id lectus ut nulla rutrum molestie eget ut quam.")
    return alert
}()
```

<br><br>

### Title

```swift
alert.configure(titleText: "Alert without icon")
```

### Icon

```swift
alert.configure(icon: getIcon(.outlinedAlertWarning))
```

### Type

```swift
let alert = NatAlert(style: .warning, type: .outlined)
```

<br>
