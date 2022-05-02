import UIKit

/**
 NatRadioButtonGroup is a class to manage a group of RadioButton components from the design system.

 Example of usage:
 
 radioButtonGroup.configure(radioButtons: [radioButton1, radioButton2, ...])
 
 radioButtonGroup.configure(selectionHandler:  { selectedRadioButton in
    // Code
 })
 */

public final class NatRadioButtonGroup {
    internal let groupID: Int = UUID().uuidString.hashValue
    private var radioButtons: [NatRadioButton] = []
    private var selectedRadioButton: NatRadioButton? {
        didSet {
            selectionHandler(selectedRadioButton)
        }
    }
    private var selectionHandler: (NatRadioButton?) -> Void = { _ in }

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
    public func configure(radioButtons: [NatRadioButton]) {
        self.radioButtons = radioButtons
        radioButtons.forEach { radioButton in
            radioButton.configure(radioButtonGroup: self)
        }
    }

    /// Sets the handler to be executed when `selectedRadioButton` value changes
    /// - Parameter selectionHandler: A closure to notify value change
    public func configure(selectionHandler: @escaping (NatRadioButton?) -> Void) {
        self.selectionHandler = selectionHandler
    }
}
