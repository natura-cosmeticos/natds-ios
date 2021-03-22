import UIKit

class NatRadioButtonContainer: UIControl, NatSelector {

    let radioButton = NatRadioButtonControl()
    let selectedPulsableColor: UIColor = getUIColorFromTokens(\.colorPrimary).withAlphaComponent(0.2)
    let unselectedPulsableColor: UIColor = getUIColorFromTokens(\.colorMediumEmphasis).withAlphaComponent(0.2)

    override var isSelected: Bool {
        get {
            radioButton.isSelected
        }
        set {
            radioButton.isSelected = newValue
        }
    }

    override var isEnabled: Bool {
        get {
            radioButton.isEnabled
        }
        set {
            radioButton.isEnabled = newValue
        }
    }

    var isHapticFeedbackEnabled: Bool {
        get {
            radioButton.isHapticFeedbackEnabled
        }
        set {
            radioButton.isHapticFeedbackEnabled = newValue
        }
    }

    var isIndeterminate: Bool {
        get {
            radioButton.isIndeterminate
        }
        set {
            radioButton.isIndeterminate = newValue
        }
    }

    var labelComponent: String? {
        get {
            radioButton.labelComponent
        }
        set {
            radioButton.labelComponent = newValue
        }
    }

    var isGrouped: Bool {
        get {
            radioButton.isGrouped
        }
        set {
            radioButton.isGrouped = newValue
        }
    }

    var groupId: Int {
        get {
            radioButton.groupId
        }
        set {
            radioButton.groupId = newValue
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
        addSubview(radioButton)

        radioButton.onTouchesBegan = { [unowned self] _ in
            self.addPulseLayerAnimated(at: self.radioButton.center, in: self.layer,
                                       withColor: isSelected ? unselectedPulsableColor : selectedPulsableColor,
                                       removeAfterAnimation: false)
        }

        radioButton.onTouchesEnded = { [unowned self] _ in
            self.removePulseLayer(layer: self.layer)
        }

        addConstraints()
    }

    private func addConstraints() {
        let checkboxSize = getTokenFromTheme(\.sizeStandard)
        let gridSize = getTokenFromTheme(\.sizeSemiX)

        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: gridSize).isActive = true
        heightAnchor.constraint(equalToConstant: gridSize).isActive = true

        radioButton.translatesAutoresizingMaskIntoConstraints = false
        radioButton.widthAnchor.constraint(equalToConstant: checkboxSize).isActive = true
        radioButton.heightAnchor.constraint(equalToConstant: checkboxSize).isActive = true
        radioButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        radioButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
