//
//  GaYaRadioButton.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 16/12/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import UIKit

public final class GaYaRadioButton: UIView {

    public var radioButton:GaYaSelectionControl = GaYaSelectionControl(style: .radioButton)
    private var group: [GaYaRadioButton] = []
    private var radioButtonGroup: GaYaRadioButtonGroup?

    // MARK: - Inits

    public init(theme: AvailableTheme = .none) {
        super.init(frame: .zero)
        self.radioButton = GaYaSelectionControl(style: .radioButton, theme: theme)
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

    internal func configure(radioButtonGroup: GaYaRadioButtonGroup) {
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
    @available(*, deprecated, message: "Use GaYaRadioButtonGroup class to manage radio buttons group instead this method")
    public func configure(addToGroup: [GaYaRadioButton]) {
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
