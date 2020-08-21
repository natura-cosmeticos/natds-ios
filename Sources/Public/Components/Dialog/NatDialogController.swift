import UIKit

/**
  NatDialogController is a class that represents Dialog component from the design system.
  The colors changes according with the current Brand configured in the Design system
  and according with user properties of Light and Dark mode.

    Available styles:
    - Standard
    - Alert(Development)

    To create and configure Dialogs it's necessary use via Dialog Builders this builds are available as class
    properties,
     Example of usage:

        let dialog = NatDialogController
        .standardStyleBuilder
        .configure(...)
        .build()

 - Requires:
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public final class NatDialogController: UIViewController {

    // MARK: - Private properties

    private let containerView: UIView = {
        let view = UIView()
        ViewStyle.applyElevation(on: view, with: getTheme().elevations.elevation08)
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

        if let view = viewModel.bodyView {
            stackView.addArrangedSubview(view)
        }

        if let view = viewModel.footerView {
            stackView.addArrangedSubview(view)
        }

        if viewModel.isDismissable {
            let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissDialog(_:)))
            view.addGestureRecognizer(dismissTapGesture)
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
        }
    }

    // MARK: - Private methods

    private func setup() {
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve

        let opacity = getTokenFromTheme(\.opacity08)
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
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -sideMargins),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -sideMargins),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: sideMargins)
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

         Example of usage:

            let dialog = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: "Body")
            .configure(primaryTitle: "Title", primaryAction: { print("lol") })
            .build()

     - Requires:
            It's necessary to configure the Design System current Brand at DesignSystem class
            or fatalError will be raised.

                DesignSystem().configure(with: Brand)
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
            .configure(primaryTitle: "Title", primaryAction: { print("lol") })
            .build()

     - Requires:
            It's necessary to configure the Design System current Brand at DesignSystem class
            or fatalError will be raised.

                DesignSystem().configure(with: Brand)
    */
    public static var alertStyleBuilder: AlertStyleBuilder { .init() }
}
