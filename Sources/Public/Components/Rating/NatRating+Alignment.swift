extension NatRating {
    public enum Alignment {
        case left
        case right
    }
}

extension NatRating {
    public enum State {
        case enabled
        case disabled

        var isInteractionEnabled: Bool {
            switch self {
            case .enabled: return true
            case .disabled: return false
            }
        }
    }
}
