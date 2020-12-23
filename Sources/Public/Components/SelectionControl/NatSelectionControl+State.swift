extension NatSelectionControl {

    enum Selection {
        case selected
        case unselected
    }

    enum State {
        case enabled(_ selection: Selection)
        case disabled
    }
}
