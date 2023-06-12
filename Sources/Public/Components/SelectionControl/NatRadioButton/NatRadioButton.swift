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

    public var radioButton:NatSelectionControl = NatSelectionControl(style: .radioButton)
    private var group: [NatRadioButton] = []
    private var radioButtonGroup: NatRadioButtonGroup?

    // MARK: - Inits

    public init(theme: AvailableTheme = .none) {
        super.init(frame: .zero)
        self.radioButton = NatSelectionControl(style: .radioButton, theme: theme)
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
                                               selector: #selector(stateWillChange(_:)),
                                               name: .stateWillChange,
                                               object: nil)
    }

    @objc internal func stateWillChange(_ notification: Notification) {
        if let id = notification.userInfo?["id"] as? Int {
            if radioButton.groupId == id {
                let selectedButton = group.filter { $0.radioButton.isSelected }.first
                for rButton in group where rButton.radioButton != selectedButton {
                    rButton.radioButton.isSelected = false
                }
            }
        }
    }

    internal func configure(radioButtonGroup: NatRadioButtonGroup) {
        self.radioButtonGroup = radioButtonGroup
        radioButton.isGrouped = true
        radioButton.groupId = radioButtonGroup.groupID
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
    @available(*, deprecated, message: "Use NatRadioButtonGroup class to manage radio buttons group instead this method")
    public func configure(addToGroup: [NatRadioButton]) {
        self.configureAddObserver()
        radioButton.isGrouped = true
        radioButton.groupId = addToGroup.hashValue
        self.group = addToGroup
    }

    /// Sets the handler to be executed when `isSelected` value changes
    ///
    /// Example of usage:
    /// ```
    /// radioButton.configure { isSelected in }
    /// ```
    /// - Parameter selectionHandler: A closure to notify value change
    public func configure(selectionHandler: @escaping SelectionHandler) {
        radioButton.handler = selectionHandler
    }
}
