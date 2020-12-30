extension NatCheckbox {
    struct Style {
        static var `default`: Style {
            Style(uncheckedBorderColor: NatColors.mediumEmphasis,
                  uncheckedBackgroundColor: .clear,
                  checkedBorderColor: NatColors.primary,
                  checkedBackgroundColor: NatColors.primary,
                  checkmarkColor: .white)
        }

        let uncheckedBorderColor: UIColor
        let uncheckedBackgroundColor: UIColor
        let checkedBorderColor: UIColor
        let checkedBackgroundColor: UIColor
        let checkmarkColor: UIColor

        func borderColor(_ isSelected: Bool, isEnabled: Bool) -> UIColor {
            isEnabled ? enabledBorderColor(isSelected) : NatColors.lowEmphasis
        }

        func backgroundColor(_ isSelected: Bool, isEnabled: Bool) -> UIColor {
            isEnabled ? enabledBackgroundColor(isSelected) : disabledBackgroundColor(isSelected)
        }

        private func enabledBorderColor(_ isSelected: Bool) -> UIColor {
            isSelected ? checkedBorderColor: uncheckedBorderColor
        }

        private func enabledBackgroundColor(_ isSelected: Bool) -> UIColor {
            isSelected ? checkedBackgroundColor : uncheckedBackgroundColor
        }

        private func disabledBackgroundColor(_ isSelected: Bool) -> UIColor {
            isSelected ? NatColors.lowEmphasis : .clear
        }
    }
}
