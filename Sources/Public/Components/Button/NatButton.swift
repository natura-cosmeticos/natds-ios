import UIKit

public class NatButton: UIButton, Pulsable {
    private let pulseContainerLayer = CAShapeLayer()
    var pulseLayer: PulseLayer?

    var updatedHandler: ((NatButton) -> Void)?

    public enum Style {
        case outlined
    }

    public override var isEnabled: Bool {
        didSet {
            updatedHandler?(self)
        }
    }

    public init(style: Style) {
        super.init(frame: .zero)

        switch style {
        case .outlined:
            ButtonStyling().applyOutilinedStyle(onButton: self)
        }

        addPulseContainerLayer()
        updatePulseContainerLayerFrame()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        updatePulseContainerLayerFrame()
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
            beginPulseAt(point: point, in: pulseContainerLayer)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        endPulse()
    }

    private func addPulseContainerLayer() {
        pulseContainerLayer.zPosition = 0
        pulseContainerLayer.masksToBounds = true
        layer.addSublayer(pulseContainerLayer)
    }

    private func updatePulseContainerLayerFrame() {
        pulseContainerLayer.frame = bounds
        pulseContainerLayer.cornerRadius = layer.cornerRadius
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
    func applyOutilinedStyle(onButton button: NatButton) {
        button.backgroundColor = .clear

        button.titleLabel?.font = NatFonts.font(ofSize: .button, withWeight: .medium)

        button.updatedHandler = { button in
            switch button.state {
            case .normal:
                button.layer.borderColor = NatColors.primary.cgColor
            case .disabled:
                button.layer.borderColor = NatColors.primary.withAlphaComponent(NatOpacities.opacity05).cgColor
            default:
                break
            }
        }

        button.layer.cornerRadius = NatBorderRadius.medium
        button.layer.borderColor = NatColors.primary.cgColor
        button.layer.borderWidth = 1
        NatElevation.apply(onView: button, elevation: .elevation02)
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
