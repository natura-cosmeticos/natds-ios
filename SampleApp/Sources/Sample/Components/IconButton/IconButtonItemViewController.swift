import NatDS

final class IconButtonItemViewController: UIViewController, SampleItem {
    static var name = "IconButton"

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = GaYaDimensions.spacingSmall
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let iconButtonDefaultStyle: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        return iconButton
    }()

    private let iconButtonDefaultStyleDisabled: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.configure(state: .disabled)
        return iconButton
    }()

    private let iconButtonPrimaryStyle: NatIconButton = {
        let iconButton = NatIconButton(style: .standardPrimary)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        return iconButton
    }()

    private let iconButtonPrimaryStyleDisabled: NatIconButton = {
        let iconButton = NatIconButton(style: .standardPrimary)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.configure(state: .disabled)
        return iconButton
    }()

    private let iconButtonLightStyle: NatIconButton = {
        let iconButton = NatIconButton(style: .standardLight)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        return iconButton
    }()

    private let iconButtonLightStyleDisabled: NatIconButton = {
        let iconButton = NatIconButton(style: .standardLight)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.configure(state: .disabled)
        return iconButton
    }()

    private let iconButtonInheritBackground: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.configure(background: .inherit)
        return iconButton
    }()

    private let iconButtonFloatBackground: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(background: .float)
        return iconButton
    }()

    private let iconButtonFloatBackgroundDisabled: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(background: .float)
        iconButton.configure(state: .disabled)
        return iconButton
    }()

    private let iconButtonOverlayBackground: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.configure(background: .overlay)
        return iconButton
    }()

    private let iconButtonOverlayBackgroundDisabled: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.configure(background: .overlay)
        iconButton.configure(state: .disabled)
        return iconButton
    }()

    private let iconButtonSizeSemi: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault, size: .semi)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        return iconButton
    }()

    private let iconButtonSizeSemiX: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault, size: .semiX)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        return iconButton
    }()

    private let iconButtonSizeMedium: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault, size: .medium)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        return iconButton
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupAction()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name
        view.backgroundColor = GaYaColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)

        addConstraints()

        stackView.addArrangedSubview(createIconButtonView(iconButtonDefaultStyle,
                                                          text: "Color high emphasis (default)"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonDefaultStyleDisabled,
                                                          text: "Color high emphasis (disabled)"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonPrimaryStyle,
                                                          text: "Color primary"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonPrimaryStyleDisabled,
                                                          text: "Color primary (disabled)"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonLightStyle,
                                                          text: "Color light"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonLightStyleDisabled,
                                                          text: "Color light (disabled)"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonInheritBackground,
                                                          text: "Inherit background (default)"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonFloatBackground,
                                                          text: "Float background"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonFloatBackgroundDisabled,
                                                          text: "Float background (disabled)"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonOverlayBackground,
                                                          text: "Overlay background"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonOverlayBackgroundDisabled,
                                                          text: "Overlay background (disabled)"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonSizeSemi,
                                                          text: "Size semi (default)"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonSizeSemiX,
                                                          text: "Size semiX"))
        stackView.addArrangedSubview(createIconButtonView(iconButtonSizeMedium,
                                                          text: "Size medium"))
    }

    private func setupAction() {
        iconButtonDefaultStyle.configure(delegate: self) { _ in
            print("Tap event")
        }
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
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -GaYaDimensions.spacingSmall),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: GaYaDimensions.spacingSmall),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerHeightConstraint,

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: GaYaDimensions.spacingSmall),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -GaYaDimensions.spacingSmall)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func createIconButtonView(_ iconButton: NatIconButton, text: String) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iconButton)
        iconButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        iconButton.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true

        let label = UILabel()
        label.textColor = GaYaColors.highEmphasis
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true

        view.isUserInteractionEnabled = true
        return view
    }
}
