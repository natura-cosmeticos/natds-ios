extension NatSnackbar {
    /// Sets the body text of the component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(body: "Texto exemplo")
    /// ```
    /// - Parameter title: An `String` that sets the title of the component

    public func configure(body: String) {
        self.bodyLabel.text = body
    }

    /// Sets the title of the component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(title: "Texto exemplo")
    /// ```
    /// - Parameter title: An `String` that sets the title of the component

    public func configure(title: String) {
        self.titleLabel.text = title
        self.titleLabel.isHidden = title.isEmpty
    }

    /// Sets an icon of the component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(icon: getIcon(icon: .outlinedAlertNotification))
    /// ```
    /// - Parameter icon: A `String` that sets an image for the icon
    public func configure(icon: String?) {
        self.iconView.iconText = icon
        self.iconView.isHidden = icon == nil
    }

    /// Sets an action button to the component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(actionButton: .text(title: "Dismiss"))
    /// ```
    /// - Parameters:
    ///   - actionButton: A `NatSnackbar.ActionButton` that indicates the type of the action button
    public func configure(actionButton: NatSnackbar.ActionButton) {
        self.setupActionButton(actionButton)
    }

    /// Sets the functionality for the action button inside the NatSnackbar component. Example:
    ///
    ///     natSnackbar.configure(delegate: self) { (self) in
    ///         // your code for icon button's tap
    ///     }
    ///
    /// - Parameters:
    ///   - delegate: the class that is the delegate for the action (usually, the class itself)
    ///   - action: a block of code to be run when the icon button is pressed
    public func configure<Object: AnyObject>(delegate: Object, action: @escaping (Object) -> Void) {
        self.action = { [weak delegate] in
            if let delegate = delegate {
                action(delegate)
            }
        }
    }

    /// Sets the feedback style to the NatSnackbar component.
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.configure(feedback: .text("Dismiss"))
    /// ```
    /// - Parameters:
    ///   - feedbackStyle: A `NatSnackbar.Feedback` that indicates the feedback style of component
    public func configure(feedback: NatSnackbar.Feedback) {
        self.setupFeedback(feedback)
    }

    /// Present the NatSnackbar on a view controller
    ///
    /// Example of usage:
    /// ```
    /// natSnackbar.present(from: self)
    /// ```
    /// - Parameters:
    ///   - from: A `UIViewController` where the component will be presented from
    ///   - timer: A `NatSnackbar.Timer` that indicates the time interval until component dismiss, defaults to .minimum
    ///   - position: A `NatSnackbar.Position` that indicates the position of the component, defaults to .bottomCenter
    ///   - animation: A `NatSnackbar.Animation` that indicates the animation for appearance, defaults to .center
    public func present(from: UIViewController,
                        timer: NatSnackbar.Timer = .minimum,
                        position: NatSnackbar.Position = .bottomCenter,
                        animation: NatSnackbar.Animation = .center) {
        guard let view = from.view, self.superview == nil else { return }

        self.timer = timer
        self.position = position
        self.animation = animation

        DispatchQueue.main.async {
            self.presentSnackbarFrom(view: view)
        }
    }
}
