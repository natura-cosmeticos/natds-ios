# Snackbar

> Snackbars provide brief messages about app processes at the bottom of the screen.

<br>

## Properties

| Property           | Values                         | Status            |
| --------------     | -------------------------      | ----------------- |
| Variant             | Standard                          | ✅  Available     |
| Title             | True, False                           | ✅  Available     |
| Icon             | True, False                           | ✅  Available     |
| Action Button        | None, Inline, Block, Icon Button           | 🗂️ Backlog     |
| Feedback (color)      | Default, Success, Error, Warning, Info            | ✅  Available     |
| Timer     | Minimum, Intermediary, *Indeterminated, Custom             | 🛠️ In improvement     |
| Position     | Top center, Bottom center             | ✅  Available     |
| Animation     | False, Right, Left, Center Bottom, Center Top        | 🗂️ Backlog     |

<br>

## Technical Usages Examples


p align="center">
  <img alt="Snackbar 1" src="./images/snackbar1.png" width="20%"> 
&nbsp; &nbsp; &nbsp; 
  <img alt="Snackbar 2" src="./images/snackbar2.png" width="20%">
&nbsp; &nbsp; &nbsp; 
  <img alt="Snackbar 3" src="./images/snackbar3.png" width="20%">
 &nbsp; &nbsp;&nbsp; 
 <img alt="Snackbar 4" src="./images/snackbar4.png" width="20%"> 
</p>
<br>

<p align="center">
  <img alt="Snackbar 5" src="./images/snackbar5.png" width="20%">
&nbsp; &nbsp; &nbsp; 
  <img alt="Snackbar 6" src="./images/snackbar6.png" width="20%">
 &nbsp; &nbsp;&nbsp; 
 <img alt="Snackbar 7" src="./images/snackbar7.png" width="20%"> 
&nbsp; &nbsp; &nbsp; 
  <img alt="Snackbar 8" src="./images/snackbar8.png" width="20%">
</p>

<br>

```swift
    let snackbar = NatSnackbar(color: .inverse)
    snackbar.configure(duration: .long)
    snackbar.configure(position: .bottom)
    snackbar.configure(icon: getIcon(.outlinedAlertCheck))
    snackbar.configure(title: "This is my title")
    snackbar.show()
```
