extension NatRating {
    /**
     Alignment represents alignment options for NatRating component (`counter`).
     
     These are all alignments allowed for a NatRating:
     - right (default)
     - left
     
     > Note: alignment configuration apply only to `counter` style NatRatings.
     This attribute must be set at `init()`.
     */

    public enum Alignment {
        case left
        case right
    }
}
