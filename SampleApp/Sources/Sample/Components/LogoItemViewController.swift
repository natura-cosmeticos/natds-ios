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

    private let logoVertical: UIImageView = {
        let imageView = UIImageView(image: LogoImages.vertical)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
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
        containerView.addSubview(logoVertical)

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

            logoHorizontal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoHorizontal.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            logoVertical.topAnchor.constraint(equalTo: logoHorizontal.bottomAnchor, constant: 16),
            logoVertical.centerXAnchor.constraint(equalTo: view.centerXAnchor),

//            logoHorizontal.widthAnchor.constraint(equalToConstant: 100),
//            logoHorizontal.heightAnchor.constraint(equalToConstant: 100)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
