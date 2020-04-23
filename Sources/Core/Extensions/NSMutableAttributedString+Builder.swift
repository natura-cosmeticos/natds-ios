extension NSMutableAttributedString {
    @discardableResult
    func apply(font: UIFont, in text: String? = nil) -> NSMutableAttributedString {
        let range = self.string.range(for: text ?? self.string)
        addAttribute(.font, value: font, range: range)

        return self
    }

    @discardableResult
    func apply(paragraphStyle: NSParagraphStyle, in text: String? = nil) -> NSMutableAttributedString {
        let range = self.string.range(for: text ?? self.string)
        addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

        return self
    }

    @discardableResult
    func apply(lineOffset: CGFloat, in text: String? = nil) -> NSMutableAttributedString {
        let range = self.string.range(for: text ?? self.string)
        addAttribute(.baselineOffset, value: lineOffset, range: range)

        return self
    }

    @discardableResult
    func apply(foregroundColor: UIColor, in text: String? = nil) -> NSMutableAttributedString {
        let range = self.string.range(for: text ?? self.string)
        addAttribute(.foregroundColor, value: foregroundColor, range: range)

        return self
    }
}
