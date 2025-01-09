//
//  GaYaCheckboxContainer.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 16/12/24.
//  Copyright © 2024 Natura. All rights reserved.
//

class GaYaCheckboxContainer: UIControl, GaYaSelector {

    var checkbox = GaYaCheckboxControl()

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

    var handler: SelectionHandler? {
        get {
            checkbox.handler
        }
        set {
            checkbox.handler = newValue
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

    var isIndeterminate: Bool {
        get {
            checkbox.isIndeterminate
        }
        set {
            checkbox.isIndeterminate = newValue
        }
    }

    var labelComponent: String? {
        get {
            checkbox.labelComponent
        }
        set {
            checkbox.labelComponent = newValue
        }
    }

    var isGrouped: Bool {
        get {
            checkbox.isGrouped
        }
        set {
            checkbox.isGrouped = newValue
        }
    }

    var groupId: Int {
        get {
            checkbox.groupId
        }
        set {
            checkbox.groupId = newValue
        }
    }
    
    var theme: AvailableTheme {
        get {
            checkbox.theme
        }
        set {
            checkbox.theme = newValue
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

    // swiftlint:disable line_length
    private func setup() {
        
        checkbox = GaYaCheckboxControl(theme: self.theme)
        addSubview(checkbox)
        
        var selectedPulsableColor: UIColor = .white
        var unselectedPulsableColor: UIColor = .white

        checkbox.onTouchesBegan = { [unowned self] _ in
            
            if (self.theme == .none) {
                 selectedPulsableColor = getUIColorFromComponentAttributes(\.colorInputComponent).withAlphaComponent(0.2)
                 unselectedPulsableColor = getUIColorFromTokens(\.colorMediumEmphasis).withAlphaComponent(0.2)
            }
            else
            {
                selectedPulsableColor = hexStringToUIColor(hex: self.theme.newInstance.components.colorInputComponent).withAlphaComponent(0.2)
                unselectedPulsableColor = getUIColorFromTokens(\.colorMediumEmphasis).withAlphaComponent(0.2)
            }
            
            self.addPulseLayerAnimated(at: self.checkbox.center, in: self.layer,
                                       withColor: self.isSelected ? unselectedPulsableColor : selectedPulsableColor,
                                       removeAfterAnimation: false)
        }
        // swiftlint:enable line_length

        checkbox.onTouchesEnded = { [unowned self] _ in
            self.removePulseLayer(layer: self.layer)
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
