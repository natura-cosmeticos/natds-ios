import UIKit

public class NatButton: UIButton, Pulsable {
    private let style: Style

    public override var isEnabled: Bool {
        didSet {
            style.changeState(self)
        }
    }

    public init(style: Style) {
        self.style = style

        super.init(frame: .zero)

        style.apply(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(title: String?) {
        style.applyTitle(title, self)
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
