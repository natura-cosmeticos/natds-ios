import UIKit

/**
 - NOTE:
 NatSnackbar is a class that represents a component from the design system.
 Its colors change according to the current brand theme.
 
 To create and configure the dialog it's necessary to use Snackbar Builders, which are available as class properties.

 Configurable elements for the dialog:
 - Title
 - Icon
 - Body
 - Action button (Text or icon button)
 - Feedback
 - Position
 - Timer
 - Animation

Example of usage:

             let snackbar = NatSnackbar()
             snackbar.configure(title: "Title")
             snackbar.configure(body: "Body")
             snackbar.present(from: self)

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public final class NatSnackbar: UIView {
    internal let inlineButtonMaxLength = 9

    internal var iconText: String?
    internal var position: NatSnackbar.Position = .bottomCenter
    internal var animation: NatSnackbar.Animation = .none
    internal var timer: NatSnackbar.Timer = .minimum

    internal var action: (() -> Void)?

    internal var topConstraint: NSLayoutConstraint?
    internal var bottomConstraint: NSLayoutConstraint?
    internal var centerXConstraint: NSLayoutConstraint?

    // MARK: - Subviews

    internal let containerView: NatCard = {
        let card = NatCard()
        card.configure(elevation: true)
        card.configure(borderRadius: true)
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()

    internal let hStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .top
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    internal let vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    internal let iconView: IconView = {
        let icon = IconView()
        icon.isHidden = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()

    internal lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .subtitle1)
        label.isHidden = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    internal lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body2)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    internal let blockButtonView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    internal let blockButton: NatButton = {
        let button = NatButton(style: .contained)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    internal let inlineButtonView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    internal let inlineButton: NatButton = {
        let button = NatButton(style: .contained)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    internal let inlineIconButtonView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    internal let inlineIconButton: NatIconButton = {
        let button = NatIconButton(style: .standardLight)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Inits

    required public init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Action Methods

    @objc func callAction() {
        self.dismissSnackbar()
        self.action?()
    }
}
