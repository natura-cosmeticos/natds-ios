import UIKit

public class NatButton: UIButton, Pulsable {
    public enum Style {
        case outlined
    }

    private let style: Style

    public override var isEnabled: Bool {
        didSet {
            ButtonStyling().changeState(onButton: self, style: style)
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
        if let title = title {
            let attributedString = ButtonStyling().applyTextForEneable(onText: title.uppercased())
            setAttributedTitle(attributedString, for: .normal)

            let attributedString2 = ButtonStyling().applyTextForDisable(onText: title.uppercased())
            setAttributedTitle(attributedString2, for: .disabled)
        } else {
            super.setAttributedTitle(nil, for: .normal)
            super.setAttributedTitle(nil, for: .disabled)
        }
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


final class TypographyStyling {
    func applyKern(onText text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)

        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: 1.25, //Button
            range: NSRange(location: 0, length: text.count)
        )

        return attributedString
    }
}

final class ButtonStyling {
    func applyStyle(onButton button: NatButton, withStyle style: NatButton.Style) {
        switch style {
        case .outlined: applyOutilinedStyle(onButton: button)
        }
    }

    func changeState(onButton button: NatButton, style: NatButton.Style) {
        switch style {
        case .outlined: ButtonStyling().applyChangeState(onButton: button)
        }
    }
}

//Outlined
extension ButtonStyling {
    private func applyOutilinedStyle(onButton button: NatButton) {
        button.backgroundColor = .clear

        button.titleLabel?.font = NatFonts.font(ofSize: .button, withWeight: .medium)

        button.layer.cornerRadius = NatBorderRadius.medium
        button.layer.borderColor = NatColors.primary.cgColor
        button.layer.borderWidth = 1
    }

    private func applyChangeState(onButton button: NatButton) {
        switch button.state {
        case .normal:
            button.layer.borderColor = NatColors.primary.cgColor
        case .disabled:
            button.layer.borderColor = NatColors.primary.withAlphaComponent(NatOpacities.opacity05).cgColor
        default: break
        }
    }

    func applyTextForEneable(onText text: String) -> NSAttributedString {
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

    func applyTextForDisable(onText text: String) -> NSAttributedString {
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
