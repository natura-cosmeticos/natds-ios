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
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()

    private lazy var disabledStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()

    private let containedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Contained")

        return button
    }()

    private let outlinedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")

        return button
    }()

    private let textButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Text")

        return button
    }()

    private let disableContainedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Contained")
        button.isEnabled = false

        return button
    }()

    private let disableOutlinedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        button.isEnabled = false

        return button
    }()

    private let disableTextButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Text")
        button.isEnabled = false

        return button
    }()

    private let containedFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Contained")

        return button
    }()

    private let disableContainedFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Disabled Contained")
        button.isEnabled = false

        return button
    }()

    private let outlinedFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")

        return button
    }()

    private let disableOutlinedFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Disabled Outlined")
        button.isEnabled = false

        return button
    }()

    private let textFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Text")

        return button
    }()

    private let disableTextFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Disabled Text")
        button.isEnabled = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        setup()

//        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
//            self.outlinedButton.configure(height: .medium)
//        }

//        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
//            self.outlinedButton.isEnabled = false
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 12.5) {
//            self.outlinedButton.isEnabled = true
//        }
    }

    private func setup() {
        view.backgroundColor = NatColors.background

        scrollView.addSubview(containerView)

        eneabledStackView.addArrangedSubview(outlinedButton)
        eneabledStackView.addArrangedSubview(containedButton)
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

            disabledStackView.topAnchor.constraint(
                equalTo: eneabledStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            disabledStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            disabledStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),

            containedFullButton.topAnchor.constraint(
                equalTo: disabledStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            containedFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            containedFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),

            disableContainedFullButton.topAnchor.constraint(
                equalTo: containedFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            disableContainedFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            disableContainedFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),

            outlinedFullButton.topAnchor.constraint(
                equalTo: disableContainedFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            outlinedFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            outlinedFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            disableOutlinedFullButton.topAnchor.constraint(
                equalTo: outlinedFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            disableOutlinedFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            disableOutlinedFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),

            textFullButton.topAnchor.constraint(
                equalTo: disableOutlinedFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            textFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            disableTextFullButton.topAnchor.constraint(
                equalTo: textFullButton.bottomAnchor,
                constant: NatSpacing.small
            ),
            disableTextFullButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            disableTextFullButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            disableTextFullButton.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -NatSpacing.small
            )
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
