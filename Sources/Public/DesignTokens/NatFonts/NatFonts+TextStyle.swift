extension NatFonts {
    struct TextStyle {
        let size: CGFloat
        let weight: UIFont.Weight
        let letterSpacing: CGFloat
    }
}

extension NatFonts.TextStyle {
    static let heading1: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.heading1FontSize),
        weight: getComponentAttributeFromTheme(\.heading1FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.heading1LetterSpacing)
    )

    static let heading2: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.heading2FontSize),
        weight: getComponentAttributeFromTheme(\.heading2FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.heading2LetterSpacing)
    )

    static let heading3: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.heading3FontSize),
        weight: getComponentAttributeFromTheme(\.heading3FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.heading3LetterSpacing)
    )

    static let heading4: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.heading4FontSize),
        weight: getComponentAttributeFromTheme(\.heading4FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.heading4LetterSpacing)
    )

    static let heading5: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.heading5FontSize),
        weight: getComponentAttributeFromTheme(\.heading5FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.heading5LetterSpacing)
    )

    static let heading6: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.heading6FontSize),
        weight: getComponentAttributeFromTheme(\.heading6FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.heading6LetterSpacing)
    )

    static let subtitle1: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.subtitle1FontSize),
        weight: getComponentAttributeFromTheme(\.subtitle1FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.subtitle1LetterSpacing)
    )

    static let subtitle2: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.subtitle2FontSize),
        weight: getComponentAttributeFromTheme(\.subtitle2FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.subtitle2LetterSpacing)
    )

    static let body1: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.body1FontSize),
        weight: getComponentAttributeFromTheme(\.body1FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.body1LetterSpacing)
    )

    static let body2: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.body2FontSize),
        weight: getComponentAttributeFromTheme(\.body2FontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.body2LetterSpacing)
    )

    // Hardcoded values because the token was deprecated.
    // Later, the button typography should also be deprecated.
    static let button: NatFonts.TextStyle = .init(
        size: 14,
        weight: UIFont.Weight.medium,
        letterSpacing: 0.44
    )

    static let caption: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.captionFontSize),
        weight: getComponentAttributeFromTheme(\.captionFontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.captionLetterSpacing)
    )

    static let overline: NatFonts.TextStyle = .init(
        size: getComponentAttributeFromTheme(\.overlineFontSize),
        weight: getComponentAttributeFromTheme(\.overlineFontWeight),
        letterSpacing: getComponentAttributeFromTheme(\.overlineLetterSpacing)
    )
}
