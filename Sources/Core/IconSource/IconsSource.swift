enum IconsSource: String {
    case natDS

    var identifier: String {
        switch self {
        case .natDS: return "org.cocoapods.NatDSIcons"
        }
    }
}
