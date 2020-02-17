extension NSMutableAttributedString {
    @discardableResult func apply(font: UIFont, in text: String) -> NSMutableAttributedString {
        let range = self.string.range(for: text)
        addAttribute(.font, value: font, range: range)

        return self
    }

    @discardableResult func apply(paragraphStyle: NSParagraphStyle, in text: String) -> NSMutableAttributedString {
        let range = self.string.range(for: text)
        addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

        return self
    }

    @discardableResult func apply(lineOffset: CGFloat, in text: String) -> NSMutableAttributedString {
        let range = self.string.range(for: text)
        addAttribute(.baselineOffset, value: lineOffset, range: range)

        return self
    }
}
