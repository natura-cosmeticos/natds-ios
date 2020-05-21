import UIKit

public final class NatButton: UIButton, Pulsable {
    private let style: Style
    private lazy var heightConstraint = heightAnchor.constraint(
        equalToConstant: Height.medium.rawValue
    )

    public override var isEnabled: Bool {
        didSet {
            style.changeState(self)
        }
    }

    public init(style: Style) {
        self.style = style

        super.init(frame: .zero)

        style.apply(self)

        translatesAutoresizingMaskIntoConstraints = false
        heightConstraint.isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(title: String?) {
        style.applyTitle(title, self)
    }

    public func configure(height: Height) {
        heightConstraint.constant = height.rawValue
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
