public final class NatLogo: UIView {

    var size: Size = .veryHuge

    var model: Model = .modelA {
        didSet {
            updateImage()
        }
    }

    var color: Color = .neutral {
        didSet {
            updateImage()
        }
    }

    var logoImage: UIImage?

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Inits

    public init(size: Size? = .veryHuge) {
        super.init(frame: .zero)
        self.size = size ?? .veryHuge
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        updateImage()
        addSubview(logoImageView)
        addConstraints()
    }

    private func addConstraints() {
        let constraints = [
            heightAnchor.constraint(equalToConstant: size.value),
            widthAnchor.constraint(equalToConstant: size.value),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoImageView.topAnchor.constraint(equalTo: topAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func updateImage() {
        if color == .neutral {
            logoImageView.image = model.neutralImage
        } else {
            logoImageView.image = model.customImage?.tintedWithColor(color.value)
        }
    }

    // MARK: - Public methods

    public func configure(model: Model) {
        self.model = model
    }

    public func configure(color: Color) {
        self.color = color
    }
}
