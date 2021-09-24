enum ButtonContainedStyle {
    static func applyStyle(on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        applyStyleForStates(on: button)
    }

    static func applyStyleForStates(on button: UIButton) {
        switch button.state {
        case .normal:
            button.backgroundColor = getUIColorFromComponentAttributes(\.buttonContainedColorEnableBackground)
            button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonContainedColorEnableBorder).cgColor
            NatElevation.apply(on: button, elevation: .tiny)
        case .disabled:
            button.backgroundColor = getUIColorFromComponentAttributes(\.buttonContainedColorDisableBackground)
            button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonContainedColorDisableBorder).cgColor
            NatElevation.apply(on: button, elevation: .none)
        default: break
        }
    }

    static func applyStyleForTitle(_ title: String, on button: UIButton) {
        ButtonStyle.applyStyleForTitle(
            title,
            colorForNormal: getUIColorFromComponentAttributes(\.buttonContainedColorEnableLabel),
            colorForDisabled: getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel),
            on: button
        )
    }

    static func focusColor() -> UIColor {
        return getUIColorFromComponentAttributes(\.buttonContainedColorFocusBackground)
    }
}
