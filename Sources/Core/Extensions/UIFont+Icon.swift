extension UIFont {
    static func iconFont(ofSize fontSize: CGFloat = 24) -> UIFont {
        let iconsFont = IconFontStyle.standard
        AssetsHelper.loadFont(iconsFont, type: .icon)
        return UIFont(name: iconsFont.name, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}
