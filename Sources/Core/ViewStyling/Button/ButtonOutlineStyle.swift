enum ButtonOutlinedStyle {
    static func applyStyle(on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        applyStyleForStates(on: button)
        button.layer.borderWidth = 1
    }

    static func applyStyleForStates(on button: UIButton) {
        switch button.state {
        case .normal:
            button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBackground)
            button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableBorder).cgColor
        case .disabled:
            button.backgroundColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBackground)
            button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableBorder).cgColor
        default: break
        }
    }

    static func applyStyleForTitle(_ title: String, on button: UIButton) {
        ButtonStyle.applyStyleForTitle(
            title,
            colorForNormal: getUIColorFromComponentAttributes(\.buttonOutlinedColorEnableLabel),
            colorForDisabled: getUIColorFromComponentAttributes(\.buttonOutlinedColorDisableLabel),
            on: button
        )
    }
}
