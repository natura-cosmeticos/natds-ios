enum IconsSource: String {
    case NatDS

    var identifier: String {
        switch self {
        case .NatDS: return "org.cocoapods.NatDSIcons"
        }
    }
}
