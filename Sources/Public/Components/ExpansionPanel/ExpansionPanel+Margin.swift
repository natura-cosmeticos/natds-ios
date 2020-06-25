extension ExpansionPanel {
    /**
      Margin is an enum that represents margin spacing values for the panel component.

        These are all spacing available for a ExpansionPanel margin:
        - top
        - left
        - right

        usage example:

            expansionPanel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                    constant: ExpansionPanel.Margin.left)

     - Requires:
            It's necessary to configure the Design System current Brand at DesignSystem class
            or fatalError will be raised.

                DesignSystem().configure(with: Brand)
    */

    public enum Margin {
        public static var top: CGFloat { NatSpacing.tiny }
        public static var left: CGFloat { NatSpacing.small }
        public static var right: CGFloat { NatSpacing.small }
    }

}
