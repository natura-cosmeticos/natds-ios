import UIKit

class NatSwitchContainer: UIControl, NatSelector {

    let switchView = NatSwitch()
    let selectedPulsableColor: UIColor = getUIColorFromTokens(\.colorPrimary).withAlphaComponent(0.2)
    let unselectedPulsableColor: UIColor = getUIColorFromTokens(\.colorMediumEmphasis).withAlphaComponent(0.2)

    override var isSelected: Bool {
        get {
            switchView.isSelected
        }
        set {
            switchView.isSelected = newValue
        }
    }

    override var isEnabled: Bool {
        get {
            switchView.isEnabled
        }
        set {
            switchView.isEnabled = newValue
        }
    }

    var isHapticFeedbackEnabled: Bool {
        get {
            switchView.isHapticFeedbackEnabled
        }
        set {
            switchView.isHapticFeedbackEnabled = newValue
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
        addSubview(switchView)

        switchView.onTouchesBegan = { [unowned self] touches in
            self.addPulseLayerAnimated(at: switchView.thumbView.center, in: switchView.thumbView.layer,
                                       withColor: isSelected ? unselectedPulsableColor : selectedPulsableColor,
                                       removeAfterAnimation: false)
        }

        switchView.onTouchesEnded = { [unowned self] touches in
            self.removePulseLayer(layer: switchView.thumbView.layer)
        }

        addConstraints()
    }

    private func addConstraints() {
        let switchSize = getTokenFromTheme(\.sizeMedium)
        let gridSize = getTokenFromTheme(\.sizeMedium)

        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: gridSize).isActive = true
        heightAnchor.constraint(equalToConstant: gridSize).isActive = true

        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.widthAnchor.constraint(equalToConstant: switchSize).isActive = true
        switchView.heightAnchor.constraint(equalToConstant: switchSize).isActive = true
        switchView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        switchView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
