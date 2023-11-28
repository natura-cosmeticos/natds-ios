# RadioButton

> Radio buttons allow users to select one option from a set.

## Properties

| Property           | Values                         | Status            |
| --------------     | -------------------------      | ----------------- |
| State             | Enabled, Pressed                          | ✅  Available     |
| Disabled          | True or False   | ✅  Available     |


## Technical Usages Examples


<p align="center">
  <img alt="1" src="./images/radiobutton.png" width="40%"> 
</p>

```swift
    private let groupFirstRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton()
        radioButton.configure(isSelected: true)
        radioButton.configure(text: "Button 1")
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let groupSecondRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton()
        radioButton.configure(text: "Button 2")
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let groupThirdRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton()
        radioButton.configure(text: "Button 3")
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let enabledUnselectedRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton()
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let enabledSelectedRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton()
        radioButton.configure(isSelected: true)
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let disabledUnselectedRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton()
        radioButton.configure(isSelected: false)
        radioButton.configure(isEnabled: false)
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let disabledSelectedRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton()
        radioButton.configure(isSelected: true)
        radioButton.configure(isEnabled: false)
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let enabledUnselectedLabelRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton(theme: .avonLight)
        radioButton.configure(text: "Enabled unselected with label")
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let enabledSelectedLabelRadioButton: NatRadioButton = {

        let radioButton = NatRadioButton(theme: .avonLight)
        radioButton.configure(text: "Enabled selected with label")
        radioButton.configure(isSelected: true)
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let disabledUnselectedLabelRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton()
        radioButton.configure(text: "Disabled unselected with label")
        radioButton.configure(isSelected: false)
        radioButton.configure(isEnabled: false)
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let disabledSelectedLabelRadioButton: NatRadioButton = {
        let radioButton = NatRadioButton()
        radioButton.configure(text: "Disabled selected with label")
        radioButton.configure(isSelected: true)
        radioButton.configure(isEnabled: false)
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private lazy var radioButtonGroup: NatRadioButtonGroup = {
        let group = NatRadioButtonGroup()
        group.configure(radioButtons: [groupFirstRadioButton, groupSecondRadioButton, groupThirdRadioButton])
        return group
    }()
```
