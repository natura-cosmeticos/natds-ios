enum AppBarSection: CaseIterable {
    case titleStyle
    case barButtonItems

    var title: String {
        switch self {
        case .titleStyle: return "Title style"
        case .barButtonItems: return "Bar button items"
        }
    }

    var items: [AppBarItem] {
        switch self {
        case .titleStyle:
            return [.logoTitleStyle, .textTitleStyle]
        case .barButtonItems:
            return [.noneBarItems, .twoBarItems]
        }
    }
}

enum AppBarItem {
    case logoTitleStyle
    case textTitleStyle
    case noneBarItems
    case twoBarItems

    var title: String {
        switch self {
        case .logoTitleStyle: return "Title"
        case .textTitleStyle: return "Logo"
        case .noneBarItems: return "None"
        case .twoBarItems: return "Two items"
        }
    }
}
