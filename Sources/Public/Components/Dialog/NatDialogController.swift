import UIKit

/**
 - NOTE:
 This component is available in the following variants:
 - ✅ Standard
 - ✅ Alert

 With the following attributes:
 - ✅ Divider
 - ✅ Size/width
 - ✅ Size/height
 - ❌ Scroll
 - ❌ Header's icon buttons
 
 NatDialogController is a class that represents a component from the design system.
 Its colors change according to the current brand theme.
 
 To create and configure the dialog it's necessary to use Dialog Builders, which are available as class properties.

 Available styles for the dialog:
 - Standard
 - Alert

 Configurable elements for the dialog:
 - Title
 - Body (Text or custom view)
 - Primary button (must be configured before other buttons)
 - Secondary button
 - Divider

Example of usage:

             let dialog = NatDialogController
             .standardStyleBuilder
             .configure(title: "Title")
             .configure(body: "Body")
             .configure(divider: true)
             .configure(primaryTitle: "Title", primaryAction: { print("Some text") })
             .build()

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public final class NatDialogController: UIViewController {

    // MARK: - Private properties

    private var completionHandler: ActionHandler?

    private let containerView: UIView = {
        let view = UIView()
        ViewStyle.applyElevation(on: view, with: .huge)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = getTokenFromTheme(\.sizeSmall)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Inits

    init(viewModel: ViewModel) {
        super.init(nibName: nil, bundle: nil)

        setup()

        if let view = viewModel.titleView {
            stackView.addArrangedSubview(view)
        }

        if let view = viewModel.topDividerView {
            stackView.addArrangedSubview(view)
        }

        if let view = viewModel.bodyView {
            stackView.addArrangedSubview(view)
        }

        if let view = viewModel.bottomDividerView {
            stackView.addArrangedSubview(view)
        }

        if let view = viewModel.footerView {
            stackView.addArrangedSubview(view)
        }

        if viewModel.isDismissable {
            let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissDialog(_:)))
            dismissTapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(dismissTapGesture)
        }

        if let handler = viewModel.dismissCompletionHandler {
            completionHandler = handler
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - User interactions

    @objc func dismissDialog(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else { return }

        let tappedAtPoint = sender.location(in: view)

        if !containerView.frame.contains(tappedAtPoint) {
            dismiss(animated: true)
            completionHandler?()
        }
    }

    // MARK: - Private methods

    private func setup() {
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve

        let opacity = getTokenFromTheme(\.opacityMediumHigh)
        view.backgroundColor = UIColor.black.withAlphaComponent(opacity)

        containerView.layer.cornerRadius = getTokenFromTheme(\.borderRadiusMedium)
        containerView.backgroundColor = getUIColorFromTokens(\.colorSurface)

        view.addSubview(containerView)
        containerView.addSubview(stackView)

        addConstraints()
    }

    private func addConstraints() {
        let sideMargins = getTokenFromTheme(\.sizeSmall)
        let containerViewMinimumWidth = containerView.widthAnchor.constraint(greaterThanOrEqualToConstant: 300)
        containerViewMinimumWidth.priority = .defaultHigh
        let containerViewMinimumHeight = containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80)
        containerViewMinimumHeight.priority = .defaultHigh

        NSLayoutConstraint.activate([
            containerView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -sideMargins),
            containerView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: sideMargins),
            containerView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.7),

            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerViewMinimumWidth,
            containerViewMinimumHeight,

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: sideMargins),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -sideMargins),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ])
    }
}

// MARK: - Class properties

extension NatDialogController {
    /**
      Class property to access StandardStyleBuilder.

        Available elements to configure:
        - Title
        - Body (Text or Custom view)
        - Primary Button (must be configured before other buttons)
        - Secondary Button (Optional)
        - Divider

         Example of usage:

            let dialog = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: "Body")
            .configure(primaryTitle: "Title", primaryAction: { print("lol") })
            .build()

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */
    public static var standardStyleBuilder: StandardStyleBuilder { .init() }

    /**
      Class property to access AlertStyleBuilder.

        Available elements to configure:
        - Title
        - Body
        - Primary Button (must be configured before other buttons)
        - Secondary Button (Optional)

         Example of usage:

            let dialog = NatDialogController
            .alertStyleBuilder
            .configure(body: "Body")
            .configure(primaryTitle: "Title", primaryAction: { print("some text") })
            .build()

     - Requires:
            It's necessary to configure the Design System with a theme or fatalError will be raised.

                DesignSystem().configure(with: AvailableTheme)
    */
    public static var alertStyleBuilder: AlertStyleBuilder { .init() }
}
