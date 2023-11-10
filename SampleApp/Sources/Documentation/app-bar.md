# App Bar Top

> The top app bar displays information and actions relating to the current screen

<br>

## Properties:

| Property           | Values                         | Status            |
| --------------     | -------------------------      | ----------------- |
| Elevation             | True, False                          | ✅  Available     |
| Color          | Primary, Secondary, Default, Inverse   | ✅  Available     |
| Action Right         | -        | ✅  Available     |
| Action Left         | -        | ✅  Available     |
| Content Position         | Left, Center        | ❌  Not applicable     |
| Content Type         | Text, Media, Search        | ✅  Available     |
| Content Proeminent         | True, False        | 🗂️  Backlog     |
 

<br>
      
## Technical Usages Examples

<br><br>

<p align="center">
  <img alt="App Bar 1" src="./images/appbar_1.png" width="20%"> 
&nbsp; &nbsp; &nbsp; 
  <img alt="App Bar 2" src="./images/appbar_2.png" width="20%">
&nbsp; &nbsp; &nbsp; 
  <img alt="App Bar 3" src="./images/appbar_3.png" width="20%">
 &nbsp; &nbsp;&nbsp; 
 <img alt="App Bar 1" src="./images/appbar_4.png" width="20%"> 
</p>
<br>

<p align="center">
  
  <img alt="App Bar 2" src="./images/appbar_5.png" width="20%">
&nbsp; &nbsp; &nbsp; 
  <img alt="App Bar 3" src="./images/appbar_6.png" width="20%">
 &nbsp; &nbsp;&nbsp; 
 <img alt="App Bar 1" src="./images/appbar_7.png" width="20%"> 
&nbsp; &nbsp; &nbsp; 
  <img alt="App Bar 2" src="./images/appbar_8.png" width="20%">
</p>
<br>
<p align="center">
  
  <img alt="App Bar 3" src="./images/appbar_9.png" width="20%">
  &nbsp; &nbsp;&nbsp; 
  <img alt="App Bar 1" src="./images/appbar_10.png" width="20%"> 
&nbsp; &nbsp; &nbsp; 
  <img alt="App Bar 3" src="./images/appbar_11.png" width="20%">
  &nbsp; &nbsp;&nbsp; 
 <img alt="App Bar 1" src="./images/appbar_12.png" width="20%"> 
</p>
<br>
<p align="center">
  <img alt="App Bar 3" src="./images/appbar_13.png" width="20%">
  &nbsp; &nbsp;&nbsp; 
  <img alt="App Bar 1" src="./images/appbar_14.png" width="20%"> 
</p>

<br>

### How to use it?

```swift
self.navigationController?.configure(appBarColor: .default, appBarContentType: .colorLogo)
self.navigationController?.configure(color: .primary)
self.navigationController?.configure(elevation: true)
self.configure(actionRight: [iconButton, customView])
self.configure(actionLeft: iconButton)
```
