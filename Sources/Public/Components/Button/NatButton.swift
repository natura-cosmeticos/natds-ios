import UIKit

public class NatButton: UIButton, Pulsable {
    public enum Style {
        case outlined
    }

    private let style: Style

    public override var isEnabled: Bool {
        didSet {
            ButtonStyling().applyStateChanges(onButton: self, withStyle: style)
        }
    }

    public init(style: Style) {
        self.style = style

        super.init(frame: .zero)

        ButtonStyling().applyStyle(onButton: self, withStyle: style)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(title: String?) {
        ButtonStyling().apply(title: title, onButton: self, withStyle: style)
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if let touch = touches.first {
            let point = touch.location(in: self)
            beginPulseAt(point: point, in: layer)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        endPulse(layer: layer)
    }
}

final class ButtonStyling {
    func applyStyle(onButton button: NatButton, withStyle style: NatButton.Style) {
        switch style {
        case .outlined: Outlined.applyStyle(onButton: button)
        }
    }

    func applyStateChanges(onButton button: NatButton, withStyle style: NatButton.Style) {
        switch style {
        case .outlined: Outlined.applyStyeForStateChanges(onButton: button)
        }
    }

    func apply(title: String?, onButton button: NatButton, withStyle style: NatButton.Style) {
        switch style {
        case .outlined: Outlined.applyStyleForTitle(title, onButton: button)
        }
    }
}

//Outlined
extension ButtonStyling {
    enum Outlined {
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
}
