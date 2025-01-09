//
//  GaYaRadioButtonGroup.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 16/12/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import UIKit

public final class GaYaRadioButtonGroup {
    internal let groupID: Int = UUID().uuidString.hashValue
    private var radioButtons: [GaYaRadioButton] = []
    private var selectedRadioButton: GaYaRadioButton? {
        didSet {
            selectionHandler(selectedRadioButton)
        }
    }
    private var selectionHandler: (GaYaRadioButton?) -> Void = { _ in }

    public init() {
        configureObservers()
    }

    private func configureObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(stateWillChange(_:)),
                                               name: .stateWillChange,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(stateHasChanged(_:)),
                                               name: .stateHasChanged,
                                               object: nil)
    }

    @objc internal func stateWillChange(_ notification: Notification) {
        if let id = notification.userInfo?["id"] as? Int {
            if groupID == id {
                let lastSelectedButton = radioButtons.filter { $0.radioButton.isSelected }.first
                for rButton in radioButtons where rButton.radioButton != lastSelectedButton {
                    rButton.radioButton.isSelected = false
                }
            }
        }
    }

    @objc internal func stateHasChanged(_ notification: Notification) {
        if let id = notification.userInfo?["id"] as? Int {
            if groupID == id {
                selectedRadioButton = radioButtons.filter { $0.radioButton.isSelected }.first
            }
        }
    }

    // MARK: - Public Methods

    /// Attribute that sets the radioButtons group
    public func configure(radioButtons: [GaYaRadioButton]) {
        self.radioButtons = radioButtons
        radioButtons.forEach { radioButton in
            radioButton.configure(radioButtonGroup: self)
        }
    }

    /// Sets the handler to be executed when `selectedRadioButton` value changes
    /// - Parameter selectionHandler: A closure to notify value change
    public func configure(selectionHandler: @escaping (GaYaRadioButton?) -> Void) {
        self.selectionHandler = selectionHandler
    }
}

