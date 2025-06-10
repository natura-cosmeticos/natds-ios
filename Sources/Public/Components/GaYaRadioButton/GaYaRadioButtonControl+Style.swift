//
//  GaYaRadioButtonControl+Style.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 02/06/25.
//  Copyright © 2025 Natura. All rights reserved.
//

extension GaYaRadioButtonControl {
    struct Style {

        // MARK: Properties

        let uncheckedBorderColor: UIColor
        let uncheckedBackgroundColor: UIColor
        let checkedBorderColor: UIColor
        let checkedBackgroundColor: UIColor
        let checkmarkColor: UIColor

        // MARK: Public Methods

        func borderColor(_ isSelected: Bool, isEnabled: Bool) -> UIColor {
            isEnabled ? enabledBorderColor(isSelected) : getUIColorFromTokens(\.colorLowEmphasis)
        }

        func backgroundColor(_ isSelected: Bool, isEnabled: Bool) -> UIColor {
            isEnabled ? enabledBackgroundColor(isSelected) : disabledBackgroundColor(isSelected)
        }

        // MARK: Private Methods

        private func enabledBorderColor(_ isSelected: Bool) -> UIColor {
            isSelected ? checkedBorderColor: uncheckedBorderColor
        }

        private func enabledBackgroundColor(_ isSelected: Bool) -> UIColor {
            isSelected ? checkedBackgroundColor : uncheckedBackgroundColor
        }

        private func disabledBackgroundColor(_ isSelected: Bool) -> UIColor {
            isSelected ? getUIColorFromTokens(\.colorLowEmphasis) : .clear
        }
    }
}
