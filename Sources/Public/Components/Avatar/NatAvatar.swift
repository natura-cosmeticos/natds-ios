/**
 Docs
 */

public final class NatAvatar: UIView {

    // MARK: - Private properties
    
    private let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = getUIColorFromTokens(\.colorPrimary)
        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = getUIColorFromTokens(\.colorOnPrimary)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let style: Style
    private let notificationCenter: NotificationCenterObservable

    // MARK: - Inits

    public convenience init(style: Style) {
        self.init(style: style, notificationCenter: NotificationCenter.default)
    }

    init(style: Style, notificationCenter: NotificationCenterObservable) {
        self.style = style
        self.notificationCenter = notificationCenter

        super.init(frame: .zero)
        setup()
    }

    // MARK: - Deinit

    deinit {
        notificationCenter.removeObserver(self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension NatAvatar {
    public func configure(initials: String) {
        label.text = initials
    }

    public func configure(image: UIImage?) {
        imageView.image = image
    }
}

// MARK: - Internal methods

extension NatAvatar {

}

// MARK: - Private methods - UI

extension NatAvatar {
    private func setup() {
        setupUI()
        
        addSubview(circleView)
        addSubview(label)
        circleView.addSubview(imageView)

        addConstraints()

        notificationCenter.addObserver(
            self,
            selector: #selector(themeHasChanged),
            name: .themeHasChanged,
            object: nil
        )
    }
    
    private func setupUI() {
        circleView.layer.cornerRadius = style.size / 2
        label.font = style.font
    }
    

    private func addConstraints() {
        let circleSize = style.size

        let constraints = [
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            circleView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.widthAnchor.constraint(equalToConstant: circleSize),
            circleView.heightAnchor.constraint(equalToConstant: circleSize),
            circleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: circleView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor),

            label.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: circleView.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - NotificationCenter

extension NatAvatar {
    @objc private func themeHasChanged() {
        // TODO:
    }
}
