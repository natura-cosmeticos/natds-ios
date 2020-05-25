enum ButtonOutlinedStyle {
    static func applyStyle(on button: UIButton) {
        button.titleLabel?.font = NatFonts.font(ofSize: .button, withWeight: .medium)
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.backgroundColor = .clear

        button.layer.cornerRadius = NatBorderRadius.medium
        button.layer.borderColor = NatColors.primary.cgColor
        button.layer.borderWidth = 1

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
            button.layer.borderColor = NatColors.primary.cgColor
        case .disabled:
            button.layer.borderColor = NatColors.primary
                .withAlphaComponent(NatOpacities.opacity05).cgColor
        default: break
        }
    }

    static func applyStyleForTitle(_ title: String?, on button: UIButton) {
        if let title = title?.uppercased() {
            let attributedStringForNormal = createTextForTitle(
                text: title,
                withColor: NatColors.onSurface
            )
            button.setAttributedTitle(attributedStringForNormal, for: .normal)

            let attributedStringForDisabled = createTextForTitle(
                text: title,
                withColor: NatColors.onSurface.withAlphaComponent(NatOpacities.opacity05)
            )
            button.setAttributedTitle(attributedStringForDisabled, for: .disabled)
        } else {
            button.setAttributedTitle(nil, for: .normal)
            button.setAttributedTitle(nil, for: .disabled)
        }
    }

    static private func createTextForTitle(text: String, withColor color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.apply(kernValue: 1.25)
        attributedString.apply(foregroundColor: color)

        return attributedString
    }
}
