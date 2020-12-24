import Foundation
import UIKit

extension NatSelectionControl {

    public enum Style {
        case checkbox
    }
}

extension NatSelectionControl.Style {

    func getSelector() -> UIControl {
        switch self {
        case .checkbox: return NatCheckboxContainer()
        }
    }
}

class NatCheckboxContainer: UIControl, Pulsable {

    let checkbox = NatCheckbox()
    let selectedPulsableColor: UIColor = NatColors.primary.withAlphaComponent(0.4)
    let unselectedPulsableColor: UIColor = NatColors.mediumEmphasis.withAlphaComponent(0.4)

    override var isSelected: Bool {
        get {
            checkbox.isSelected
        } set {
            checkbox.isSelected = newValue
        }
    }

    override var isEnabled: Bool {
        get {
            checkbox.isEnabled
        } set {
            checkbox.isEnabled = newValue
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
        translatesAutoresizingMaskIntoConstraints = false

        let padding: CGFloat = 20

        checkbox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        checkbox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        checkbox.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        checkbox.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
    }
}
