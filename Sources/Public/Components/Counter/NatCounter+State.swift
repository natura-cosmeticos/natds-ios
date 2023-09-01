extension NatCounter {

    /**
     State represents state values for NatCounter component.

     These are all states allowed for a NatCounter:
     - enabled
     - disabled
     */

    public enum State {
        case enabled
        case disabled
    }
    
    public enum MinValue {
        case value0
        case value1
    }
}
