enum ButtonContainedStyle {
    static func applyStyle(on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        applyStyleForStates(on: button)
    }

    static func applyStyleForStates(on button: UIButton) {
        switch button.state {
        case .normal:
            button.backgroundColor = NatColors.primary
            NatElevation.apply(on: button, elevation: .tiny)
        case .disabled:
            button.backgroundColor = NatColors.onSurface.withAlphaComponent(NatOpacities.veryLow)
            NatElevation.apply(on: button, elevation: .none)
        default: break
        }
    }

    static func applyStyleForTitle(_ title: String, on button: UIButton) {
        ButtonStyle.applyStyleForTitle(
            title,
            colorForNormal: NatColors.onPrimary,
            on: button
        )
    }
}
