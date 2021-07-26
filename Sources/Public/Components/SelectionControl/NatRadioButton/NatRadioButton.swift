import UIKit

/**
 NatRadioButton is a class that represents the RadioButton component from the design system.

 Example of usage:

 radioButton.configure(isSelected: true)
 radioButton.configure(isEnabled: true)
 radioButton.configure(text: "Example with label")
 radioButton.configure(addToGroup: natRadioButtonGroup)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

 DesignSystem().configure(with: AvailableTheme)
 */

public final class NatRadioButton: UIView {

    public var radioButton = NatSelectionControl(style: .radioButton)
    private var group: [NatRadioButton] = []

    // MARK: - Inits

    public init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(radioButton)
        addConstraints()
    }

    private func addConstraints() {
        radioButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            radioButton.topAnchor.constraint(equalTo: topAnchor),
            radioButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            radioButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            radioButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func configureAddObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(stateHasChanged(_:)),
                                               name: .stateHasChanged,
                                               object: nil)
    }

    @objc internal func stateHasChanged(_ notification: Notification) {
        if let id = notification.userInfo?["id"] as? Int {
            if radioButton.groupId == id {
                let selectedButton = group.filter { $0.radioButton.isSelected }.first
                for rButton in group where rButton.radioButton != selectedButton {
                    rButton.radioButton.isSelected = false
                }
            }
        }
    }

    // MARK: - Public Methods

    /// Attribute that sets a label to the component
    public func configure(text: String?) {
        radioButton.configure(text: text)
    }

    /// Attribute that sets and checks if the component is selected.
    public func configure(isSelected: Bool) {
        radioButton.isSelected = isSelected
    }

    /// Attribute that sets and checks if the component is enabled.
    public func configure(isEnabled: Bool) {
        radioButton.isEnabled = isEnabled
    }

    /// Attribute that adds the radioButton is a group.
    public func configure(addToGroup: [NatRadioButton]) {
        self.configureAddObserver()
        radioButton.isGrouped = true
        radioButton.groupId = addToGroup.hashValue
        self.group = addToGroup
    }

    public func configure(handler: SelectionHandler) {
        radioButton.handler = handler
    }
}
