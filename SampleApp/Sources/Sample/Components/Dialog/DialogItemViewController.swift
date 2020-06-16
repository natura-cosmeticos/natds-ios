import NatDS

final class DialogItemViewController: UIViewController, SampleItem {
    static var name = "Dialog"

    // MARK: - Private properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let fullStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let containedFullButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Contained")
        button.addTarget(self, action: #selector(actionHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    // MARK: - Actions

    @objc func actionHandler () {
        let dialog = NatDialogController
            .standartBuilder
            .configure(title: "Title")
            .configure(body: "Some body Some body Some body Some body Some body Some body Some body Some body SomebodySome")
            .configure(primaryTitle: "Foo big foo text algo assim", primaryAction: { print("Foo") })
            .configure(secondaryTitle: "Foo2", secondaryAction: { self.navigationController?.presentedViewController?.dismiss(animated: true)
            })
            .build()

        navigationController?.present(dialog, animated: true)
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = NatColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)

        containerView.addSubview(fullStackView)

        fullStackView.addArrangedSubview(containedFullButton)

        addConstraints()
    }

    private func addConstraints() {
        let containerHeightConstraint = containerView.centerYAnchor
            .constraint(equalTo: scrollView.centerYAnchor)
        containerHeightConstraint.priority = .defaultLow

        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),

            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -NatSpacing.small),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: NatSpacing.small),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerHeightConstraint,

            fullStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.small),
            fullStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            fullStackView.bottomAnchor.constraint(
                greaterThanOrEqualTo: containerView.bottomAnchor,
                constant: -NatSpacing.small
            ),

            containedFullButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
