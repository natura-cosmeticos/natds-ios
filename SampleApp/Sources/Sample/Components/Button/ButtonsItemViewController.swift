import NatDS

final class ButtonsItemViewController: UIViewController, SampleItem {
    static var name = "Button"

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

    private let eneabledStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let containedButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Contained")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let outlinedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let textButton: NatButton = {
        let button = NatButton(style: .text)
        button.configure(title: "Text")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disabledStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let disableContainedButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Contained")
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

    private let disableTextButton: NatButton = {
        let button = NatButton(style: .text)
        button.configure(title: "Text")
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
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
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableContainedFullButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Disabled Contained")
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

    private let textFullButton: NatButton = {
        let button = NatButton(style: .text)
        button.configure(title: "Text")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableTextFullButton: NatButton = {
        let button = NatButton(style: .text)
        button.configure(title: "Disabled Text")
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let containedIconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let outlinedIconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let containedIconRightButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Contained")
        button.configure(icon: .outlinedDefaultMockup, position: .right)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let containedIconLeftButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Contained")
        button.configure(icon: .outlinedDefaultMockup, position: .left)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let outlinedIconRightButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        button.configure(icon: .outlinedDefaultMockup, position: .right)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let outlinedIconLeftButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        button.configure(icon: .outlinedDefaultMockup, position: .left)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name

        view.backgroundColor = NatColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)

        containerView.addSubview(eneabledStackView)
        containerView.addSubview(disabledStackView)
        containerView.addSubview(disabledStackView)
        containerView.addSubview(fullStackView)
        containerView.addSubview(containedIconStackView)
        containerView.addSubview(outlinedIconStackView)

        eneabledStackView.addArrangedSubview(containedButton)
        eneabledStackView.addArrangedSubview(outlinedButton)
        eneabledStackView.addArrangedSubview(textButton)

        disabledStackView.addArrangedSubview(disableContainedButton)
        disabledStackView.addArrangedSubview(disableOutlinedButton)
        disabledStackView.addArrangedSubview(disableTextButton)

        fullStackView.addArrangedSubview(containedFullButton)
        fullStackView.addArrangedSubview(disableContainedFullButton)
        fullStackView.addArrangedSubview(outlinedFullButton)
        fullStackView.addArrangedSubview(disableOutlinedFullButton)
        fullStackView.addArrangedSubview(textFullButton)
        fullStackView.addArrangedSubview(disableTextFullButton)

        containedIconStackView.addArrangedSubview(containedIconLeftButton)
        containedIconStackView.addArrangedSubview(containedIconRightButton)

        outlinedIconStackView.addArrangedSubview(outlinedIconLeftButton)
        outlinedIconStackView.addArrangedSubview(outlinedIconRightButton)

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

            eneabledStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.small),
            eneabledStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            eneabledStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            eneabledStackView.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            disabledStackView.topAnchor.constraint(equalTo: eneabledStackView.bottomAnchor, constant: NatSpacing.small),
            disabledStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            disabledStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            disabledStackView.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            fullStackView.topAnchor.constraint(equalTo: disabledStackView.bottomAnchor, constant: NatSpacing.small),
            fullStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),

            containedFullButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),

            containedIconStackView.topAnchor.constraint(equalTo: fullStackView.bottomAnchor, constant: NatSpacing.small),
            containedIconStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            containedIconStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),

            outlinedIconStackView.topAnchor.constraint(equalTo: containedIconStackView.bottomAnchor, constant: NatSpacing.small),
            outlinedIconStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            outlinedIconStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            outlinedIconStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -NatSpacing.small
            )
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
