//enum AppBarSection: CaseIterable {
//    case titleStyle
//    case barButtonItems
//
//    var title: String {
//        switch self {
//        case .titleStyle: return "Title style"
//        case .barButtonItems: return "Bar button items"
//        }
//    }
//
//    var items: [AppBarItem] {
//        switch self {
//        case .titleStyle:
//            return [.logoTitleStyle, .textTitleStyle]
//        case .barButtonItems:
//            return [.noneBarItems, .twoBarItems]
//        }
//    }
//}

//enum AppBarItem {
//    case logoTitleStyle
//    case textTitleStyle
//    case noneBarItems
//    case twoBarItems
//
//    var title: String {
//        switch self {
//        case .logoTitleStyle: return "Title"
//        case .textTitleStyle: return "Logo"
//        case .noneBarItems: return "None"
//        case .twoBarItems: return "Two items"
//        }
//    }
//}

enum AppBarSection: CaseIterable {
    case color
    case elevation
    case action
    case position

    var title: String {
        switch self {
        case .color: return "Color"
        case .elevation: return "Elevation"
        case .action: return "Actions Right and Left"
        case .position: return "Position"
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
        case .position:
            return [.positionLeft, .positionCenter]
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
    case positionLeft
    case positionCenter

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
        case .positionLeft: return "Position left"
        case .positionCenter: return "Position center"
        }
    }
}
