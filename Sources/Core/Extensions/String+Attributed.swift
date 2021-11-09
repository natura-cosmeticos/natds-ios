extension String {
    func attributedStringWith(lineHeight: CGFloat, letterSpacing: CGFloat) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        let attributedString = NSMutableAttributedString(string: self)
            .apply(kernValue: letterSpacing)
            .apply(paragraphStyle: paragraphStyle)
        attributedString.apply(paragraphStyle: paragraphStyle)

        return attributedString
    }
}
