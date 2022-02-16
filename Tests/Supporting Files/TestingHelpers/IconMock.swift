public enum Icon: String, CaseIterable {
    case filledDefaultMockup = "filled-default-mockup"
    case outlinedDefaultMockup = "outlined-default-mockup"

    var unicode: String {
        switch self {
        case .filledDefaultMockup: return "\u{EA16}"
        case .outlinedDefaultMockup: return "\u{EA96}"
        }
    }
}

public func getIconMockup(_ icon: Icon) -> String {
    return icon.unicode
}
