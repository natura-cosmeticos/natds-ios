enum ButtonTextStyle {
    static func applyStyle(on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
    }

    static func applyStyleForStates(on button: UIButton) {
        switch button.state {
        case .normal:
            button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBackground)
            button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorEnableBorder).cgColor
        case .disabled:
            button.backgroundColor = getUIColorFromComponentAttributes(\.buttonTextColorDisableBackground)
            button.layer.borderColor = getUIColorFromComponentAttributes(\.buttonTextColorDisableBorder).cgColor
        default: break
        }
    }

    static func applyStyleForTitle(_ title: String, on button: UIButton) {
        ButtonStyle.applyStyleForTitle(
            title,
            colorForNormal: getUIColorFromComponentAttributes(\.buttonTextColorEnableLabel),
            colorForDisabled: getUIColorFromComponentAttributes(\.buttonTextColorDisableLabel),
            on: button
        )
    }

    static func focusColor() -> UIColor {
        return getUIColorFromComponentAttributes(\.buttonTextColorFocusBackground)
    }
}
