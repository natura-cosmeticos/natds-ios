import UIKit

public final class NatButton: UIButton, Pulsable {

    // MARK: - Private properties

    private let style: Style

    // MARK: - Public properties

    public override var isEnabled: Bool {
        didSet {
            style.changeState(self)
        }
    }

    // MARK: - Inits

    public init(style: Style) {
        self.style = style

        super.init(frame: .zero)

        style.applyStyle(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    public func configure(title: String?) {
        style.applyTitle(title, self)
    }

    // MARK: - Overrides

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

// MARK: - NatButton - Height

extension NatButton {
    public enum Height {
        public static var small: CGFloat { getTheme().sizes.semi }
        public static var medium: CGFloat { getTheme().sizes.semiX }
        public static var large: CGFloat { getTheme().sizes.medium }
    }
}
