extension NatSwitch {
    struct Style {
        
        // MARK: Static Properties
        
        static var `default`: Style {
            Style(onTintColor: getUIColorFromTokens(\.colorPrimaryLight),
                  offTintColor: getUIColorFromTokens(\.colorMediumEmphasis),
                  onThumbTintColor: getUIColorFromTokens(\.colorPrimary),
                  offThumbTintColor: getUIColorFromTokens(\.colorSurface))
        }
        
        // MARK: Properties

        let onTintColor: UIColor
        let offTintColor: UIColor
        let onThumbTintColor: UIColor
        let offThumbTintColor: UIColor
        
        // MARK: Public Methods

        func thumbColor(_ isOn: Bool, isEnabled: Bool) -> UIColor {
            isEnabled ? enabledThumbColor(isOn) : getUIColorFromTokens(\.colorLowEmphasis)
        }

        func backgroundColor(_ isOn: Bool, isEnabled: Bool) -> UIColor {
            isEnabled ? enabledBackgroundColor(isOn) : getUIColorFromTokens(\.colorLowEmphasis)
        }
        
        // MARK: Private Methods

        private func enabledThumbColor(_ isOn: Bool) -> UIColor {
            isOn ? onThumbTintColor : offThumbTintColor
        }

        private func enabledBackgroundColor(_ isOn: Bool) -> UIColor {
            isOn ? onTintColor : offTintColor
        }
    }
}
