//
//  GaYaCheckboxControl+Style.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 16/12/24.
//  Copyright © 2024 Natura. All rights reserved.
//

extension GaYaCheckboxControl {
    struct Style {

        // MARK: Static Properties

        static var `default`: Style {
            Style(uncheckedBorderColor: getUIColorFromTokens(\.colorPrimary),
                  uncheckedBackgroundColor: .clear,
                  checkedBorderColor: getUIColorFromTokens(\.colorPrimary),
                  checkedBackgroundColor: getUIColorFromTokens(\.colorPrimary),
                  checkmarkColor: .white)
        }

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

