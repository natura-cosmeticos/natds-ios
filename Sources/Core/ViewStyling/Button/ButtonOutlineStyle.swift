enum ButtonOutlinedStyle {
    static func applyStyle(onButton button: NatButton) {
        button.backgroundColor = .clear

        button.titleLabel?.font = NatFonts.font(ofSize: .button, withWeight: .medium)

        button.layer.cornerRadius = NatBorderRadius.medium
        button.layer.borderColor = NatColors.primary.cgColor
        button.layer.borderWidth = 1
    }

    static func applyStyeForStateChanges(onButton button: NatButton) {
        switch button.state {
        case .normal:
            button.layer.borderColor = NatColors.primary.cgColor
        case .disabled:
            button.layer.borderColor = NatColors.primary.withAlphaComponent(NatOpacities.opacity05).cgColor
        default: break
        }
    }

    static func applyStyleForTitle(_ title: String?, onButton button: NatButton) {
        if let title = title {
            let attributedStringForNormal = createTextForOutlinedEneable(onText: title.uppercased())
            button.setAttributedTitle(attributedStringForNormal, for: .normal)

            let attributedStringForDisabled = createTextForOutlinedDisable(onText: title.uppercased())
            button.setAttributedTitle(attributedStringForDisabled, for: .disabled)
        } else {
            button.setAttributedTitle(nil, for: .normal)
            button.setAttributedTitle(nil, for: .disabled)
        }
    }

    static private func createTextForOutlinedEneable(onText text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)

        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: 1.25, //Button
            range: NSRange(location: 0, length: text.count)
        )

        attributedString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: NatColors.onSurface,
            range: NSRange(location: 0, length: text.count))

        return attributedString
    }

    static private func createTextForOutlinedDisable(onText text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)

        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: 1.25, //Button
            range: NSRange(location: 0, length: text.count)
        )

        attributedString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: NatColors.onSurface.withAlphaComponent(NatOpacities.opacity05),
            range: NSRange(location: 0, length: text.count))

        return attributedString
    }
}
