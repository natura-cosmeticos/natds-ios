extension ExpansionPanel {
    /**
      Margin is an enum that represents margin spacing values for the panel component.

        This is the spacing available for a ExpansionPanel margin:
        - horizontalMargin

        Usage example:

            expansionPanel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                    constant: ExpansionPanel.Margin.horizontalMargin)

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */

    public enum Margin {
        public static var horizontalMargin: CGFloat { NatSpacing.small }
    }

}
