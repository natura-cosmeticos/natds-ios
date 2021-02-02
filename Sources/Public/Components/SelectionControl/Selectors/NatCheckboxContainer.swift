import UIKit

protocol NatSelector: UIControl, Pulsable {
    var isHapticFeedbackEnabled: Bool { get set }
}

class NatCheckboxContainer: UIControl, NatSelector {
    /**
     NatCheckbox is a class that represents  selection control checkbox  component from the design system.
     The checkbox colors changes according with the current theme configured in the Design system.

    This checkbox has these status:
    - isSelected
    - isEnabled

            Example of usage:
                - checkbox.isSelected = true
                - checkbox.isEnabled = true

     - Requires:
     It's necessary to configure the Design System with a theme or fatalError will be raised.
     DesignSystem().configure(with: AvailableTheme)
     */

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
        let checkboxSize = getTokenFromTheme(\.sizeStandard)
        let gridSize = getTokenFromTheme(\.sizeSemiX)

        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: gridSize).isActive = true
        heightAnchor.constraint(equalToConstant: gridSize).isActive = true

        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.widthAnchor.constraint(equalToConstant: checkboxSize).isActive = true
        checkbox.heightAnchor.constraint(equalToConstant: checkboxSize).isActive = true
        checkbox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkbox.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
