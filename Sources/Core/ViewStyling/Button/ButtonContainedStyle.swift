enum ButtonContainedStyle {
    static func applyStyle(on button: UIButton) {
        ButtonStyle.applyStyle(on: button)
        button.backgroundColor = NatColors.primary
        NatElevation.apply(on: button, elevation: .elevation02)
    }

    static func applyStyleForStates(on button: UIButton) {
        switch button.state {
        case .normal:
            button.backgroundColor = NatColors.primary
        case .disabled:
            button.backgroundColor = NatColors.onSurface.withAlphaComponent(NatOpacities.opacity03)
//            NatElevation.apply(on: button, elevation: .elevation01)
            button.layer.shadowColor = nil
            button.layer.shadowOffset = CGSize(width: 0, height: -3)
            button.layer.shadowRadius = 3
            button.layer.shadowOpacity = 0
        default: break
        }
    }

    static func applyStyleForTitle(_ title: String?, on button: UIButton) {
        ButtonStyle.applyStyleForTitle(
            title,
            colorForNormal: NatColors.onPrimary,
            colorForDisable: NatColors.onSurface.withAlphaComponent(NatOpacities.opacity06),
            on: button
        )
    }
}
