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

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let dialogStandardButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "standard")
        button.addTarget(self, action: #selector(showStandardDialog), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let dialogWithDividerStandardButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "standard with divider")
        button.addTarget(self, action: #selector(showDividerStandardDialog), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let dialogAlertButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "alert")
        button.addTarget(self, action: #selector(showAlertDialog), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let dialogNotDismissableButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "not dismissable dialog")
        button.addTarget(self, action: #selector(showNotDismissableDialog), for: .touchUpInside)
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

    @objc func showStandardDialog() {
        let dialog = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Confirm button") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .configure(secondaryButtonTitle: "Close") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .build()

        navigationController?.present(dialog, animated: true)
    }

    @objc func showDividerStandardDialog() {
        let dialog = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(divider: true)
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Confirm button") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .configure(secondaryButtonTitle: "Close") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .build()

        navigationController?.present(dialog, animated: true)
    }

    @objc func showAlertDialog() {
        let dialog = NatDialogController
            .alertStyleBuilder
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Confirm") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .configure(secondaryButtonTitle: "Close") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .build()

        navigationController?.present(dialog, animated: true)
    }

    @objc func showNotDismissableDialog() {
        let dialog = NatDialogController
            .alertStyleBuilder
            .configure(body: "Attention: Dismissable is Dialog property, that can be configured for all styles.")
            .configure(isDismissable: false)
            .configure(primaryButtonTitle: "Confirm") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .configure(secondaryButtonTitle: "Close") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .build()

        navigationController?.present(dialog, animated: true)
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = NatColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)

        containerView.addSubview(stackView)

        stackView.addArrangedSubview(dialogStandardButton)
        stackView.addArrangedSubview(dialogWithDividerStandardButton)
        stackView.addArrangedSubview(dialogAlertButton)
        stackView.addArrangedSubview(dialogNotDismissableButton)

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

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.small),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.bottomAnchor.constraint(
                greaterThanOrEqualTo: containerView.bottomAnchor,
                constant: -NatSpacing.small
            ),

            dialogStandardButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
