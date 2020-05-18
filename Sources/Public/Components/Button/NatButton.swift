import UIKit

public class NatButton: UIButton, Pulsable {
    private let pulseContainerLayer = CAShapeLayer()
    var pulseLayer: PulseLayer?

    public enum Style {
        case outlined
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

    public override func setTitle(_ title: String?, for state: UIControl.State) {
        if let title = title {
            let attributedString = TypographyStyling().applyKern(onText: title.uppercased())
            setAttributedTitle(attributedString, for: state)
        } else {
            super.setTitle(title, for: state)
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
    func applyOutilinedStyle(onButton button: UIButton) {
        button.backgroundColor = NatColors.surface

        button.setTitleColor(NatColors.onSurface, for: .normal)
        button.titleLabel?.font = NatFonts.font(ofSize: .button, withWeight: .medium)

        button.setTitleColor(NatColors.onSurface, for: .disabled)
        button.titleLabel?.font = NatFonts.font(ofSize: .button, withWeight: .medium)

        button.layer.cornerRadius = NatBorderRadius.medium
        button.layer.borderColor = NatColors.primary.cgColor
        button.layer.borderWidth = 1
        //Elevation
        //...toooo dooooo
    }
}
