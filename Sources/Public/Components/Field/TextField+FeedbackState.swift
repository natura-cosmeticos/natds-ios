extension TextField {
    /**
     FeedbackState is an enum that represents the possible states for a TextField.
     The chosen state indicates the type of feedback should be displayed, and sets the style for the textField.
     The `error` and `success` states also display an icon with the corresponding color and image.
     The `none` state clears the textField if they're already configured with another state.
     
     These are all states allowed for a TextField:
     - error
     - success
     - none
     */
    public enum FeedbackState {
        case error
        case success
        case none
    }
}
