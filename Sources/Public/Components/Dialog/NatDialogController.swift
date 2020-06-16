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
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Inits

    init(views: [UIView]) {
        super.init(nibName: nil, bundle: nil)

        setup()

        views.forEach { stackView.addArrangedSubview($0) }
    }

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
        let minimumHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 100)
        minimumHeightConstraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 16),
            containerView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16),
            containerView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),

            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            minimumHeightConstraint,

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -NatSpacing.small),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: NatSpacing.small)
        ])
    }
}

extension NatDialogController {
    public static var standardBuilder: StandardBuilder { .init() }
}
