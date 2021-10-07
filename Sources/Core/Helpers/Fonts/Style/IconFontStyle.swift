enum IconFontStyle: FontStyle {
    case standard

    var filename: String {
        switch self {
        case .standard: return "natds-icons-ios"
        }
    }

    var name: String {
        switch self {
        case .standard: return "natds-icons"
        }
    }

    var familyName: String {
        switch self {
        case .standard: return "natds-icons"
        }
    }
}
