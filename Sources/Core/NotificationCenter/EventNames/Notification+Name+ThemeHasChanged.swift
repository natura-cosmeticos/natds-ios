extension Notification.Name {
    static var themeHasChanged: Notification.Name {
        return .init(rawValue: "ThemeHasChanged")
    }

    static var stateWillChange: Notification.Name {
        return .init(rawValue: "StateWillChange")
    }

    static var stateHasChanged: Notification.Name {
        return .init(rawValue: "StateHasChanged")
    }
}
