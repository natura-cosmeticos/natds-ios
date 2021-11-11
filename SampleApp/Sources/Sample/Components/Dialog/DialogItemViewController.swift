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

    private let dialogStandardLongTextButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "standard with long title button")
        button.addTarget(self, action: #selector(showStandardLongTextDialog), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let dialogStandardBigViewButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "standard with max height")
        button.addTarget(self, action: #selector(showStandardBigViewDialog), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let dialogStandardCustomViewButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "standard with custom view")
        button.addTarget(self, action: #selector(showStandardCustomViewDialog), for: .touchUpInside)
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
            .configure(dismissActionHandler: {
                print("Standard Dialog was dismissed")
            })
            .build()

        navigationController?.present(dialog, animated: true)
    }

    @objc func showStandardLongTextDialog() {
        let dialog = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Button with long title") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .configure(secondaryButtonTitle: "Other button") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .build()

        navigationController?.present(dialog, animated: true)
    }

    // swiftlint:disable line_length
    @objc func showStandardBigViewDialog() {
        let dialog = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: "Some body text to make a snapshot text without think about the future. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare est mi. Ut porttitor nunc scelerisque, suscipit nisl non, cursus neque. Suspendisse ac mattis lorem. Nulla tincidunt eros sodales, auctor sem eu, condimentum magna. Cras facilisis posuere est a facilisis. Duis sit amet tincidunt massa. Vivamus malesuada lacus at mattis sagittis. Quisque fermentum augue non feugiat lobortis. Ut ac turpis at lorem mollis interdum vel vel eros. Maecenas tempus, magna eget placerat ultrices, lectus augue aliquet elit, ac euismod mauris dolor non augue. Phasellus id porttitor erat. Morbi a viverra nisi. Praesent id arcu lorem. Suspendisse sollicitudin sit amet elit sed sodales. Nunc ex elit, convallis non neque eget, egestas vestibulum nisi. Etiam fringilla nulla mi, in eleifend felis condimentum at. Integer suscipit sit amet ipsum eget euismod. Cras et diam dignissim, mollis nunc facilisis, malesuada felis.")
            .configure(primaryButtonTitle: "Primary") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .configure(secondaryButtonTitle: "Secondary") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .build()

        navigationController?.present(dialog, animated: true)
    }

    @objc func showStandardCustomViewDialog() {
        let dialog = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: NatImage())
            .configure(primaryButtonTitle: "Primary") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .configure(secondaryButtonTitle: "Secondary") {
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
            .configure(body: "Tapping outside the Dialog does not dismiss it. Dismissable is a property for Dialog and can be configured for all styles.")
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
        stackView.addArrangedSubview(dialogStandardLongTextButton)
        stackView.addArrangedSubview(dialogStandardBigViewButton)
        stackView.addArrangedSubview(dialogStandardCustomViewButton)
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
