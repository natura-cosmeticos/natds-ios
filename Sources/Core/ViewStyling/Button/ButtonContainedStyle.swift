enum ButtonContainedStyle {
    static func applyStyle(on button: UIButton) {
        button.titleLabel?.font = NatFonts.font(ofSize: .button, withWeight: .medium)
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.backgroundColor = NatColors.primary

        button.layer.cornerRadius = NatBorderRadius.medium

        NatElevation.apply(on: button, elevation: .elevation02)

        let spacing = getTheme().spacing.small
        button.contentEdgeInsets = UIEdgeInsets(
            top: spacing,
            left: spacing,
            bottom: spacing,
            right: spacing
        )
    }

    static func applyStyleForStates(on button: UIButton) {
        switch button.state {
        case .normal:
            button.backgroundColor = NatColors.primary
        case .disabled:
            button.backgroundColor = NatColors.onSurface.withAlphaComponent(NatOpacities.opacity03)
//            NatElevation.apply(on: button, elevation: .elevation01)
        default: break
        }
    }

    static func applyStyleForTitle(_ title: String?, on button: UIButton) {
        if let title = title?.uppercased() {
            let attributedStringForNormal = createTextForTitle(
                text: title,
                withColor: NatColors.onPrimary
            )

            button.setAttributedTitle(attributedStringForNormal, for: .normal)

            let attributedStringForDisabled = createTextForTitle(
                text: title,
                withColor: NatColors.onSurface.withAlphaComponent(NatOpacities.opacity06)
            )

            button.setAttributedTitle(attributedStringForDisabled, for: .disabled)
        } else {
            button.setAttributedTitle(nil, for: .normal)
            button.setAttributedTitle(nil, for: .disabled)
        }
    }

    static private func createTextForTitle(text: String, withColor color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.apply(foregroundColor: color)

        let value = getTheme().font.letterSpacings.button
        attributedString.apply(kernValue: value)

        return attributedString
    }
}
