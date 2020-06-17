import UIKit

/**
  ????

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public final class NatDialogController: UIViewController {

    // MARK: - Private properties

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = getTheme().spacing.small
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Inits

    init(views: [UIView]) {
        super.init(nibName: nil, bundle: nil)

        setup()

        views.forEach { stackView.addArrangedSubview($0) }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve

        let opacity = getTheme().opacities.opacity08
        view.backgroundColor = UIColor.black.withAlphaComponent(opacity)

        containerView.layer.cornerRadius = getTheme().borderRadius.medium
        containerView.backgroundColor = getTheme().colors.surface

        view.addSubview(containerView)
        containerView.addSubview(stackView)

        addConstraints()
    }

    private func addConstraints() {
        let sideMargins = getTheme().spacing.small
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
    public static var standardStyleBuilder: StandardStyleBuilder { .init() }
}
