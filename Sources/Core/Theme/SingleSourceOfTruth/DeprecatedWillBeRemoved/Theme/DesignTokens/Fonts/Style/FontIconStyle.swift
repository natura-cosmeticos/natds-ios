enum FontIconStyle: FontStyle {
    case standard

    var filename: String {
        switch self {
        case .standard: return "natds-icons"
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
