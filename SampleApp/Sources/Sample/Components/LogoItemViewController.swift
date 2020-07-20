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

    private let logoHorizontal: UIImageView = {
        let imageView = UIImageView(image: LogoImages.horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let labelLogoHorizontal: UILabel = {
        let label = UILabel()
        label.text = "Logo Horizontal"
        label.font = NatFonts.font(ofSize: .heading6, withWeight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let logoVertical: UIImageView = {
        let imageView = UIImageView(image: LogoImages.vertical)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let labelLogoVertical: UILabel = {
        let label = UILabel()
        label.text = "Logo Vertical"
        label.font = NatFonts.font(ofSize: .heading6, withWeight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

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

        containerView.addSubview(logoHorizontal)
        containerView.addSubview(labelLogoHorizontal)
        containerView.addSubview(logoVertical)
        containerView.addSubview(labelLogoVertical)

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

            logoHorizontal.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.xLarge),
            logoHorizontal.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelLogoHorizontal.topAnchor.constraint(equalTo: logoHorizontal.bottomAnchor, constant: NatSpacing.small),
            labelLogoHorizontal.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            logoVertical.topAnchor.constraint(equalTo: labelLogoHorizontal.bottomAnchor, constant: NatSpacing.xLarge),
            logoVertical.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelLogoVertical.topAnchor.constraint(equalTo: logoVertical.bottomAnchor, constant: NatSpacing.small),
            labelLogoVertical.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelLogoVertical.bottomAnchor.constraint(
                lessThanOrEqualTo: containerView.bottomAnchor,
                constant: -NatSpacing.small
            )
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
