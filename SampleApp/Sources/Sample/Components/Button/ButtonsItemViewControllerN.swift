import NatDS

// swiftlint:disable function_body_length

final class ButtonsItemViewControllerN: UIViewController, SampleItem {
    static var name = "Button N"

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

    private lazy var eneabledStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private lazy var disabledStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let containedButton: ContainedButton = {
        let button = ContainedButton()
        button.setTitle("Contained", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let outlinedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let textButton: FlatButton = {
        let button = FlatButton()
        button.setTitle("Text", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableContainedButton: ContainedButton = {
        let button = ContainedButton()
        button.setTitle("Contained", for: .disabled)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableOutlinedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableTextButton: FlatButton = {
        let button = FlatButton()
        button.setTitle("Text", for: .disabled)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let containedFullButton: ContainedButton = {
        let button = ContainedButton()
        button.setTitle("Contained", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableContainedFullButton: ContainedButton = {
        let button = ContainedButton()
        button.setTitle("Disabled Contained", for: .disabled)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let outlinedFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableOutlinedFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Disabled Outlined")
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let textFullButton: FlatButton = {
        let button = FlatButton()
        button.setTitle("Text", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableTextFullButton: FlatButton = {
        let button = FlatButton()
        button.setTitle("Disabled Text", for: .disabled)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    private func setup() {
        view.backgroundColor = NatColors.background

        scrollView.addSubview(containerView)

        eneabledStackView.addArrangedSubview(containedButton)
        eneabledStackView.addArrangedSubview(outlinedButton)
        eneabledStackView.addArrangedSubview(textButton)

        disabledStackView.addArrangedSubview(disableContainedButton)
        disabledStackView.addArrangedSubview(disableOutlinedButton)
        disabledStackView.addArrangedSubview(disableTextButton)

        containerView.addSubview(containedFullButton)
        containerView.addSubview(disableContainedFullButton)

        containerView.addSubview(outlinedFullButton)
        containerView.addSubview(disableOutlinedFullButton)
        containerView.addSubview(textFullButton)
        containerView.addSubview(disableTextFullButton)

        view.addSubview(scrollView)
        view.addSubview(eneabledStackView)
        view.addSubview(disabledStackView)

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
            containerView.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor,
                constant: -NatSpacing.small
            ),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: NatSpacing.small
            ),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerHeightConstraint,

            eneabledStackView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: NatSpacing.small
            ),
            eneabledStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            eneabledStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            eneabledStackView.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            disabledStackView.topAnchor.constraint(
                equalTo: eneabledStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            disabledStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            disabledStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            disabledStackView.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            containedFullButton.topAnchor.constraint(
                equalTo: disabledStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            containedFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            containedFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containedFullButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            disableContainedFullButton.topAnchor.constraint(
                equalTo: containedFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            disableContainedFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            disableContainedFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            disableContainedFullButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            outlinedFullButton.topAnchor.constraint(
                equalTo: disableContainedFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            outlinedFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            outlinedFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            outlinedFullButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            disableOutlinedFullButton.topAnchor.constraint(
                equalTo: outlinedFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            disableOutlinedFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            disableOutlinedFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            disableOutlinedFullButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            textFullButton.topAnchor.constraint(
                equalTo: disableOutlinedFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            textFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textFullButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            disableTextFullButton.topAnchor.constraint(
                equalTo: textFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            disableTextFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            disableTextFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            disableTextFullButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),
            disableTextFullButton.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -NatSpacing.small
            )
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
