extension String {

    func withIcon(_ icon: String) -> NSAttributedString {
        let fullText = "\(icon) \(self)"
        let iconParagraphStyle = NSMutableParagraphStyle()
        iconParagraphStyle.maximumLineHeight = Fonts.caption.lineHeight

        return NSMutableAttributedString(string: fullText)
            .apply(font: Fonts.caption, in: self)
            .apply(lineOffset: 1, in: self)
            .apply(font: UIFont.iconFont(ofSize: Fonts.caption.lineHeight), in: icon)
            .apply(paragraphStyle: iconParagraphStyle, in: icon)
            .apply(lineOffset: -2, in: icon)
    }

    func range(for text: String) -> NSRange {
        return (self as NSString).range(of: text)
    }
}
