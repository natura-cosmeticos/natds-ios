extension TextField {
    public enum InteractionState: CaseIterable {
        case enabled
        case disabled
        case readOnly
        case active
        case filled

        var isUserInteractionEnabled: Bool {
            switch self {
            case .disabled, .readOnly:
                return false
            default:
                return true
            }
        }
    }
}
