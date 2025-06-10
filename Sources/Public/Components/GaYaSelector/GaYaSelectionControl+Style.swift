//
//  GaYaSelectionControl+Style.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 02/06/25.
//  Copyright © 2025 Natura. All rights reserved.
//

extension GaYaSelectionControl {
    
    public enum Style {
        case checkbox
        case radioButton

        var fontSize: CGFloat {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelFontSize)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelFontSize)
            }
        }

        var fontFamily: String {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelPrimaryFontFamily)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelPrimaryFontFamily)
            }
        }

        var fontWeight: UIFont.Weight {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelPrimaryFontWeight)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelPrimaryFontWeight)
            }
        }

        var lineHeight: CGFloat {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelLineHeight)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelLineHeight)
            }
        }

        var letterSpacing: CGFloat {
            switch self {
            case .checkbox: return getComponentAttributeFromTheme(\.checkboxLabelLetterSpacing)
            case .radioButton: return getComponentAttributeFromTheme(\.radioButtonLabelLetterSpacing)
            }
        }
    }
}

extension GaYaSelectionControl.Style {
    func getSelector() -> GaYaSelector {
        switch self {
        case .checkbox: return GaYaCheckboxContainer()
        case .radioButton: return GaYaRadioButtonContainer()
        }
    }
}
