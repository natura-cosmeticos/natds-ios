enum AppBarSection: CaseIterable {
    case color
    case elevation
    case action
    case contentType

    var title: String {
        switch self {
        case .color: return "Color"
        case .elevation: return "Elevation"
        case .action: return "Actions Right and Left"
        case .contentType: return "Content Type"
        }
    }

    var items: [AppBarItem] {
        switch self {
        case .color:
            return [.colorDefault, .colorPrimary, .colorNone, .colorInverse]
        case .elevation:
            return [.elevationTrue, .elevationFalse]
        case .action:
            return [.oneActionRight, .threeActionsRight, .oneActionLeft]
        case .contentType:
            return [.text, .media]
        }
    }
}

enum AppBarItem {
    case colorDefault
    case colorPrimary
    case colorNone
    case colorInverse
    case elevationTrue
    case elevationFalse
    case oneActionRight
    case threeActionsRight
    case oneActionLeft
    case text
    case media

    var title: String {
        switch self {
        case .colorDefault: return "Color default"
        case .colorPrimary: return "Color primary"
        case .colorNone: return "Color none"
        case .colorInverse: return "Color inverse"
        case .elevationTrue: return "Elevation: true"
        case .elevationFalse: return "Elevation: false"
        case .oneActionRight: return "Action Right (one)"
        case .threeActionsRight: return "Action Right (maximum)"
        case .oneActionLeft: return "Action Left"
        case .text: return "Content type: Text"
        case .media: return "Content type: Media"
        }
    }
}
