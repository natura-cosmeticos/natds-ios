extension String {

    func withIcon(_ icon: String) -> NSAttributedString {
        let fullText = "\(icon) \(self)"

        let attrText = NSMutableAttributedString(string: fullText)

        let messageRange = (fullText as NSString).range(of: self)
        let messageAttr: [NSAttributedString.Key: Any] = [
            .font: Fonts.caption,
            .baselineOffset: 1
        ]

        attrText.addAttributes(messageAttr, range: messageRange)

        let iconParagraphStyle = NSMutableParagraphStyle()
        iconParagraphStyle.maximumLineHeight = Fonts.caption.lineHeight

        let iconRange = (fullText as NSString).range(of: icon)
        let iconAttr: [NSAttributedString.Key: Any] = [
            .font: UIFont.iconFont(ofSize: Fonts.caption.lineHeight),
            .paragraphStyle: iconParagraphStyle,
            .baselineOffset: -2
        ]

        attrText.addAttributes(iconAttr, range: iconRange)

        return attrText
    }
}
