class AssetsHelper {
    static func image(from name: String) -> UIImage? {
        let bundle = Bundle(for: self)
        return UIImage(named: name, in: bundle, compatibleWith: nil)
    }

    static func loadFont(_ font: FontStyle) {
        let fontNames = UIFont.fontNames(forFamilyName: font.familyName)
        if !fontNames.contains(font.name) {
            registerFont(font.filename)
        }
    }

    private static func registerFont(_ name: String) {
        var error: Unmanaged<CFError>?
//        let bundle = Bundle(for: self)
        
        guard let bundle = Bundle(identifier: "org.cocoapods.NatDSIcons") else {
            return
        }

        guard let pathForResource = bundle.url(forResource: name, withExtension: "ttf") else {
            return
        }

        if !CTFontManagerRegisterFontsForURL(pathForResource as CFURL, CTFontManagerScope.process, &error) {
            print(error as Any)
        }
    }
}
