import UIKit

/**
  ????

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public final class NatDialogController: UIViewController { //add View

    // MARK: - Private properties

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Inits

    init(views: [UIView]) {
        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        modalTransitionStyle = UIModalTransitionStyle.crossDissolve

        setup()

        views.forEach { stackView.addArrangedSubview($0) }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        let opacity = getTheme().opacities.opacity08
        view.backgroundColor = UIColor.black.withAlphaComponent(opacity)
        containerView.layer.cornerRadius = getTheme().borderRadius.medium
        containerView.backgroundColor = getTheme().colors.surface

        view.addSubview(containerView)
        containerView.addSubview(stackView)

        addConstraints()
    }

    private func addConstraints() {
        let minimumHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 100)
        minimumHeightConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -NatSpacing.small),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            minimumHeightConstraint,
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -NatSpacing.small),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: NatSpacing.small),
        ])
    }
}

extension NatDialogController {
    public static var standartBuilder: StandartBuilder { .init() }
}

extension NatDialogController {
    struct ButtonAction {
        let title: String
        let action: () -> Void
    }

    public final class StandartBuilder {
        private var title: String?
        private var body: String?
        private var primaryAction: ButtonAction?
        private var secondaryAction: ButtonAction?

        public func configure(title: String) -> Self {
            self.title = title

            return self
        }

        public func configure(body: String) -> Self {
            self.body = body

            return self
        }

        public func configure(primaryTitle title: String, primaryAction action: @escaping () -> Void) -> Self {
            primaryAction = .init(title: title, action: action)

            return self
        }

        public func configure(secondaryTitle title: String, secondaryAction action: @escaping () -> Void) -> Self {
            secondaryAction = .init(title: title, action: action)

            return self
        }

        public func build() -> NatDialogController {
            var views: [UIView] = []

            if let title = title {
                let titleView = TitleView()
                titleView.set(title: title)

                views.append(titleView)
            }

            if let body = body {
                let bodyView = BodyView()
                bodyView.set(body: body)

                views.append(bodyView)
            }

            if let primaryAction = primaryAction,
               let secondaryAction = secondaryAction {

                let footerView = FooterView(primaryAction: primaryAction, secondaryAction: secondaryAction)
                views.append(footerView)
            }

            return .init(views: views)
        }
    }
}
