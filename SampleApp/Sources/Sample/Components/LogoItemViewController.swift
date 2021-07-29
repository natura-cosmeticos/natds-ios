import NatDS

final class LogoItemViewController: UIViewController, SampleItem {
    static var name = "Logo"

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

    private lazy var logoModelA = createLogo()
    private lazy var logoModelB = createLogo(model: .modelB)
    private lazy var logoPrimary = createLogo(color: .primary)
    private lazy var logoSecondary = createLogo(color: .secondary)
    private lazy var logoHighlight = createLogo(color: .highlight)
    private lazy var logoSurface = createLogo(color: .surface)
    private lazy var logoMedium = createLogo(size: .medium)
    private lazy var logoMediumX = createLogo(size: .mediumX)
    private lazy var logoLarge = createLogo(size: .large)
    private lazy var logoLargeX = createLogo(size: .largeX)
    private lazy var logoLargeXX = createLogo(size: .largeXX)
    private lazy var logoLargeXXX = createLogo(size: .largeXXX)
    private lazy var logoHuge = createLogo(size: .huge)
    private lazy var logoHugeX = createLogo(size: .hugeX)
    private lazy var logoHugeXX = createLogo(size: .hugeXX)
    private lazy var logoHugeXXX = createLogo(size: .hugeXXX)
    private lazy var logoVeryHuge = createLogo(size: .veryHuge)

    private lazy var labelLogoModelA = createLabel(text: "Model A")
    private lazy var labelLogoModelB = createLabel(text: "Model B")
    private lazy var labelLogoPrimary = createLabel(text: "Primary")
    private lazy var labelLogoSecondary = createLabel(text: "Secondary")
    private lazy var labelLogoHighlight = createLabel(text: "Highlight")
    private lazy var labelLogoSurface = createLabel(text: "Surface")
    private lazy var labelLogoMedium = createLabel(text: "Size Medium")
    private lazy var labelLogoMediumX = createLabel(text: "Size MediumX")
    private lazy var labelLogoLarge = createLabel(text: "Size Large")
    private lazy var labelLogoLargeX = createLabel(text: "Size LargeX")
    private lazy var labelLogoLargeXX = createLabel(text: "Size LargeXX")
    private lazy var labelLogoLargeXXX = createLabel(text: "Size LargeXXX")
    private lazy var labelLogoHuge = createLabel(text: "Size Huge")
    private lazy var labelLogoHugeX = createLabel(text: "Size HugeX")
    private lazy var labelLogoHugeXX = createLabel(text: "Size HugeXX")
    private lazy var labelLogoHugeXXX = createLabel(text: "Size HugeXXX")
    private lazy var labelLogoVeryHuge = createLabel(text: "Size VeryHuge")

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = NatColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)

        containerView.addSubview(logoModelA)
        containerView.addSubview(labelLogoModelA)
        containerView.addSubview(logoModelB)
        containerView.addSubview(labelLogoModelB)
        containerView.addSubview(logoPrimary)
        containerView.addSubview(labelLogoPrimary)
        containerView.addSubview(logoSecondary)
        containerView.addSubview(labelLogoSecondary)
        containerView.addSubview(logoHighlight)
        containerView.addSubview(labelLogoHighlight)
        containerView.addSubview(logoSurface)
        containerView.addSubview(labelLogoSurface)
        containerView.addSubview(logoMedium)
        containerView.addSubview(labelLogoMedium)
        containerView.addSubview(logoMediumX)
        containerView.addSubview(labelLogoMediumX)
        containerView.addSubview(logoLarge)
        containerView.addSubview(labelLogoLarge)
        containerView.addSubview(logoLargeX)
        containerView.addSubview(labelLogoLargeX)
        containerView.addSubview(logoLargeXX)
        containerView.addSubview(labelLogoLargeXX)
        containerView.addSubview(logoLargeXXX)
        containerView.addSubview(labelLogoLargeXXX)
        containerView.addSubview(logoHuge)
        containerView.addSubview(labelLogoHuge)
        containerView.addSubview(logoHugeX)
        containerView.addSubview(labelLogoHugeX)
        containerView.addSubview(logoHugeXX)
        containerView.addSubview(labelLogoHugeXX)
        containerView.addSubview(logoHugeXXX)
        containerView.addSubview(labelLogoHugeXXX)
        containerView.addSubview(logoVeryHuge)
        containerView.addSubview(labelLogoVeryHuge)

        addConstraints()
    }

    // swiftlint:disable function_body_length
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

            logoModelA.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.small),
            logoModelA.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoModelA.topAnchor.constraint(equalTo: logoModelA.bottomAnchor, constant: NatSpacing.micro),
            labelLogoModelA.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoModelB.topAnchor.constraint(equalTo: labelLogoModelA.bottomAnchor, constant: NatSpacing.small),
            logoModelB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoModelB.topAnchor.constraint(equalTo: logoModelB.bottomAnchor, constant: NatSpacing.micro),
            labelLogoModelB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoPrimary.topAnchor.constraint(equalTo: labelLogoModelB.bottomAnchor, constant: NatSpacing.small),
            logoPrimary.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoPrimary.topAnchor.constraint(equalTo: logoPrimary.bottomAnchor, constant: NatSpacing.micro),
            labelLogoPrimary.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoSecondary.topAnchor.constraint(equalTo: labelLogoPrimary.bottomAnchor, constant: NatSpacing.small),
            logoSecondary.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoSecondary.topAnchor.constraint(equalTo: logoSecondary.bottomAnchor, constant: NatSpacing.micro),
            labelLogoSecondary.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoHighlight.topAnchor.constraint(equalTo: labelLogoSecondary.bottomAnchor, constant: NatSpacing.small),
            logoHighlight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoHighlight.topAnchor.constraint(equalTo: logoHighlight.bottomAnchor, constant: NatSpacing.micro),
            labelLogoHighlight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoSurface.topAnchor.constraint(equalTo: labelLogoHighlight.bottomAnchor, constant: NatSpacing.small),
            logoSurface.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoSurface.topAnchor.constraint(equalTo: logoSurface.bottomAnchor, constant: NatSpacing.micro),
            labelLogoSurface.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoMedium.topAnchor.constraint(equalTo: labelLogoSurface.bottomAnchor, constant: NatSpacing.small),
            logoMedium.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoMedium.topAnchor.constraint(equalTo: logoMedium.bottomAnchor, constant: NatSpacing.micro),
            labelLogoMedium.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoMediumX.topAnchor.constraint(equalTo: labelLogoMedium.bottomAnchor, constant: NatSpacing.small),
            logoMediumX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoMediumX.topAnchor.constraint(equalTo: logoMediumX.bottomAnchor, constant: NatSpacing.micro),
            labelLogoMediumX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoLarge.topAnchor.constraint(equalTo: labelLogoMediumX.bottomAnchor, constant: NatSpacing.small),
            logoLarge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoLarge.topAnchor.constraint(equalTo: logoLarge.bottomAnchor, constant: NatSpacing.micro),
            labelLogoLarge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoLargeX.topAnchor.constraint(equalTo: labelLogoLarge.bottomAnchor, constant: NatSpacing.small),
            logoLargeX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoLargeX.topAnchor.constraint(equalTo: logoLargeX.bottomAnchor, constant: NatSpacing.micro),
            labelLogoLargeX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoLargeXX.topAnchor.constraint(equalTo: labelLogoLargeX.bottomAnchor, constant: NatSpacing.small),
            logoLargeXX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoLargeXX.topAnchor.constraint(equalTo: logoLargeXX.bottomAnchor, constant: NatSpacing.micro),
            labelLogoLargeXX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoLargeXXX.topAnchor.constraint(equalTo: labelLogoLargeXX.bottomAnchor, constant: NatSpacing.small),
            logoLargeXXX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoLargeXXX.topAnchor.constraint(equalTo: logoLargeXXX.bottomAnchor, constant: NatSpacing.micro),
            labelLogoLargeXXX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoHuge.topAnchor.constraint(equalTo: labelLogoLargeXXX.bottomAnchor, constant: NatSpacing.small),
            logoHuge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoHuge.topAnchor.constraint(equalTo: logoHuge.bottomAnchor, constant: NatSpacing.micro),
            labelLogoHuge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoHugeX.topAnchor.constraint(equalTo: labelLogoHuge.bottomAnchor, constant: NatSpacing.small),
            logoHugeX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoHugeX.topAnchor.constraint(equalTo: logoHugeX.bottomAnchor, constant: NatSpacing.micro),
            labelLogoHugeX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoHugeXX.topAnchor.constraint(equalTo: labelLogoHugeX.bottomAnchor, constant: NatSpacing.small),
            logoHugeXX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoHugeXX.topAnchor.constraint(equalTo: logoHugeXX.bottomAnchor, constant: NatSpacing.micro),
            labelLogoHugeXX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoHugeXXX.topAnchor.constraint(equalTo: labelLogoHugeXX.bottomAnchor, constant: NatSpacing.small),
            logoHugeXXX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoHugeXXX.topAnchor.constraint(equalTo: logoHugeXXX.bottomAnchor, constant: NatSpacing.micro),
            labelLogoHugeXXX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            logoVeryHuge.topAnchor.constraint(equalTo: labelLogoHugeXXX.bottomAnchor, constant: NatSpacing.small),
            logoVeryHuge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            labelLogoVeryHuge.topAnchor.constraint(equalTo: logoVeryHuge.bottomAnchor, constant: NatSpacing.micro),
            labelLogoVeryHuge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),
            labelLogoVeryHuge.bottomAnchor.constraint(
                lessThanOrEqualTo: containerView.bottomAnchor,
                constant: -NatSpacing.small
            )
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = NatFonts.font(ofSize: .heading6, withWeight: .regular)
        label.textColor = NatColors.highEmphasis
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    private func createLogo(size: NatLogo.Size = .veryHuge,
                            color: NatLogo.Color = .neutral,
                            model: NatLogo.Model = .modelA) -> NatLogo {
        let logo = NatLogo(size: size)
        logo.configure(model: model)
        logo.configure(color: color)
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }
}
