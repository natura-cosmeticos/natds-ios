class AssetsHelper {
    enum FontType {
        case icon
        case custom
    }

    static func image(from name: String) -> UIImage? {
        let bundle = Bundle(for: self)
        return UIImage(named: name, in: bundle, compatibleWith: nil)
    }

    static func logo(from token: String) -> UIImage? {
        let logoToken = "Logo/"+token
        return self.image(from: logoToken)
    }

    static func loadFont(_ font: FontStyle, type: FontType) {
        let fontNames = UIFont.fontNames(forFamilyName: font.familyName)
        if !fontNames.contains(font.name) {
            registerFont(font.filename, type)
        }
    }

    private static func registerFont(_ name: String, _ type: FontType) {
        var error: Unmanaged<CFError>?
        var fontBundle: Bundle?

        switch type {
        case .icon:
            fontBundle = Bundle(identifier: IconsSource.natDS.identifier)
        case .custom:
            fontBundle = Bundle(for: self)
        }

        guard let bundle = fontBundle else { return }
        guard let pathForResource = bundle.url(forResource: name, withExtension: "ttf") else { return }

        if !CTFontManagerRegisterFontsForURL(pathForResource as CFURL, CTFontManagerScope.process, &error) {
            print(error as Any)
        }
    }
}
