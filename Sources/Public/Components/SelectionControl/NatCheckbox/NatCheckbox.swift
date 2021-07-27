import UIKit

/**
 NatCheckbox is a class that represents the Checkbox component from the design system.

 Example of usage:

        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: true)
        checkbox.configure(text: "Example with label")
        checkbox.configure(isIndeterminate: true)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */

public final class NatCheckbox: UIView {

    public var checkbox = NatSelectionControl(style: .checkbox)

    // MARK: - Inits
    public init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(checkbox)
        addConstraints()
    }

    private func addConstraints() {
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkbox.topAnchor.constraint(equalTo: topAnchor),
            checkbox.bottomAnchor.constraint(equalTo: bottomAnchor),
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkbox.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    /// Attribute that sets a label to the component
    public func configure(text: String?) {
        checkbox.configure(text: text)
    }

    /// Attribute that sets and checks if the component is selected.
    public func configure(isSelected: Bool) {
        checkbox.isSelected = isSelected
    }

    /// Attribute that sets and checks if the component is enabled.
    public func configure(isEnabled: Bool) {
        checkbox.isEnabled = isEnabled
    }

    /// Attribute that sets and checks if indeterminate state is selected
    public func configure(isIndeterminate: Bool) {
        checkbox.isIndeterminate = isIndeterminate
    }

    public func configure(selectionHandler: @escaping SelectionHandler) {
        checkbox.handler = selectionHandler
    }
}
