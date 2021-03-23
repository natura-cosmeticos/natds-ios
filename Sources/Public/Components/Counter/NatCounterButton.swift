import UIKit

/**
 DOCS
 */

final class NatCounterButton: UIView, Pulsable {

    private var action: (() -> Void)?

    internal let iconView: IconView = {
        let iconView = IconView(fontSize: NatSizes.micro)
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        addGestureRecognizer(tapGesture)

        border

        translatesAutoresizingMaskIntoConstraints = false

        addSubview(iconView)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
            widthAnchor.constraint(equalToConstant: 32),

            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    @objc func tapHandler(_ sender: UIGestureRecognizer) {
        action?()
    }

    internal func configure(action: @escaping () -> Void) {
        self.action = action
    }

    internal func configure(iconImage: UIImage?) {
        iconView.defaultImageView.image = iconImage
        translatesAutoresizingMaskIntoConstraints = false
    }

    internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let opacity = getTokenFromTheme(\.opacityDisabledLow)
        let color = iconView.tintColor.withAlphaComponent(opacity)

        addPulseLayerAnimated(
            at: centerBounds,
            in: layer,
            withColor: color,
            removeAfterAnimation: true
        )
    }
}
