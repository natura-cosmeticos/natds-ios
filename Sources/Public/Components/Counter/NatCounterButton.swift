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

    internal let iconView: IconView = {
        let iconView = IconView(fontSize: NatSizes.micro)
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()

    init() {
        super.init(frame: .zero)
        setupLayout()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(iconView)

        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 20),
            iconView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }

    func setupLayout() {
        clipsToBounds = true
        layer.borderColor = NatColors.highEmphasis.cgColor
        layer.borderWidth = 0.5

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        addGestureRecognizer(tapGesture)
    }

    @objc func tapHandler(_ sender: UIGestureRecognizer) {
        guard currentState == .enabled else { return }
        action?()
    }

    internal func configure(action: @escaping () -> Void) {
        self.action = action
    }

    internal func configure(iconImage: UIImage?) {
        iconView.defaultImageView.image = iconImage
        translatesAutoresizingMaskIntoConstraints = false
    }

    internal func configure(height: CGFloat, width: CGFloat) {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ])
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
