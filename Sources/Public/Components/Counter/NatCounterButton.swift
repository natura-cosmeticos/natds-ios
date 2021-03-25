import UIKit

/**
 DOCS
 */

final class NatCounterButton: UIView, Pulsable {
    public enum State {
        case enabled
        case disabled
    }

    private var action: (() -> Void)?
    internal var currentState: State = .enabled

    internal let iconLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .button, withWeight: .medium)
        label.textColor = getUIColorFromTokens(\.colorHighEmphasis)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    init() {
        super.init(frame: .zero)
        setupLayout()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(iconLabel)

        NSLayoutConstraint.activate([
            iconLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupLayout() {
        clipsToBounds = true
        layer.borderColor = NatColors.highEmphasis.cgColor
        layer.borderWidth = 0.5

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        addGestureRecognizer(tapGesture)
    }

    internal func configure(action: @escaping () -> Void) {
        self.action = action
    }

    internal func configure(iconLabel: String?) {
        self.iconLabel.text = iconLabel
    }

    internal func configure(height: CGFloat, width: CGFloat) {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ])
    }

    @objc func tapHandler(_ sender: UIGestureRecognizer) {
        guard currentState == .enabled else { return }
        action?()
    }

    internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard currentState == .enabled else { return }

        let color = getUIColorFromTokens(\.colorHighEmphasis).withAlphaComponent(0.2)

        addPulseLayerAnimated(
            at: centerBounds,
            in: layer,
            withColor: color,
            removeAfterAnimation: true
        )
    }
}
