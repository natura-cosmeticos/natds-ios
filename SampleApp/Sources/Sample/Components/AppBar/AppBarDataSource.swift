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
    
    var title: String {
        switch self {
        case .color: return "Color"
        case .elevation: return "Elevation"
        }
    }
    
    var items: [AppBarItem] {
        switch self {
        case .color:
            return [.colorDefault, .colorPrimary, .colorNone, .colorInverse]
        case .elevation:
            return [.elevationTrue, .elevationFalse]
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
    
    var title: String {
        switch self {
        case .colorDefault: return "Color default"
        case .colorPrimary: return "Color primary"
        case .colorNone: return "Color none"
        case .colorInverse: return "Color inverse"
        case .elevationTrue: return "Elevation: true"
        case .elevationFalse: return "Elevation: false"
        }
    }
}
