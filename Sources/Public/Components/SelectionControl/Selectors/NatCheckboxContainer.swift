import UIKit

protocol NatSelector: UIControl, Pulsable {
    var isHapticFeedbackEnabled: Bool { get set }
}

class NatCheckboxContainer: UIControl, NatSelector {

    let checkbox = NatCheckbox()
    let selectedPulsableColor: UIColor = getUIColorFromTokens(\.colorPrimary).withAlphaComponent(0.2)
    let unselectedPulsableColor: UIColor = getUIColorFromTokens(\.colorMediumEmphasis).withAlphaComponent(0.2)

    override var isSelected: Bool {
        get {
            checkbox.isSelected
        }
        set {
            checkbox.isSelected = newValue
        }
    }

    override var isEnabled: Bool {
        get {
            checkbox.isEnabled
        }
        set {
            checkbox.isEnabled = newValue
        }
    }

    var isHapticFeedbackEnabled: Bool {
        get {
            checkbox.isHapticFeedbackEnabled
        }
        set {
            checkbox.isHapticFeedbackEnabled = newValue
        }
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width / 2
    }

    private func setup() {
        addSubview(checkbox)

        checkbox.onTouchesBegan = { [unowned self] touches in
            self.addPulseLayerAnimated(at: checkbox.center, in: layer,
                                       withColor: isSelected ? unselectedPulsableColor : selectedPulsableColor,
                                       removeAfterAnimation: false)
        }

        checkbox.onTouchesEnded = { [unowned self] touches in
            self.removePulseLayer(layer: layer)
        }

        addConstraints()
    }

    private func addConstraints() {
        let padding: CGFloat = 10
        let size = getTokenFromTheme(\.sizeSemiX)

        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size).isActive = true
        heightAnchor.constraint(equalToConstant: size).isActive = true

        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        checkbox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        checkbox.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        checkbox.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
    }
}
