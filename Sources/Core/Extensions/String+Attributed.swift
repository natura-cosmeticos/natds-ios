extension String {
    func attributedStringWith(lineHeight: CGFloat,
                              letterSpacing: CGFloat,
                              paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()) -> NSMutableAttributedString {
        let mutableParagraph = paragraphStyle
        mutableParagraph.lineSpacing = lineHeight
        let attributedString = NSMutableAttributedString(string: self)
            .apply(kernValue: letterSpacing)
            .apply(paragraphStyle: mutableParagraph)
        attributedString.apply(paragraphStyle: paragraphStyle)

        return attributedString
    }
}
