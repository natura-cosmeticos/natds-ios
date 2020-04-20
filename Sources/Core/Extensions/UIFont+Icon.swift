extension UIFont {
    static func iconFont(ofSize fontSize: CGFloat = 24) -> UIFont {
        let iconsFont = FontIconStyle.standard
        AssetsHelper.loadFont(iconsFont)
        return UIFont(name: iconsFont.name, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}
