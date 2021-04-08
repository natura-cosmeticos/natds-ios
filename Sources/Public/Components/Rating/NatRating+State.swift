extension NatRating {
    /**
     State represents state options for NatRating component (`input`).
     
     These are all states allowed for a NatRating:
     - enabled (default)
     - disabled
     
     > Note: state configuration apply only to `input` style NatRatings.
     This attribute must be set with a `configure(state:)` method.
     */

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
