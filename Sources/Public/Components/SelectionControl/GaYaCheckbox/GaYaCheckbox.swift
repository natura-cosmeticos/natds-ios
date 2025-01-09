//
//  GaYaCheckbox.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 16/12/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import UIKit

public final class GaYaCheckbox: UIView {

    public var checkbox = GaYaSelectionControl(style: .checkbox)

    // MARK: - Inits
    public init(theme: AvailableTheme = .none) {
        super.init(frame: .zero)
        self.checkbox = GaYaSelectionControl(style: .checkbox, theme: theme)
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

    /// Sets the handler to be executed when `isSelected` value changes
    ///
    /// Example of usage:
    /// ```
    /// checkbox.configure { isSelected in }
    /// ```
    /// - Parameter selectionHandler: A closure to notify value change
    public func configure(selectionHandler: @escaping SelectionHandler) {
        checkbox.handler = selectionHandler
    }
}
