/**
 Docs
 */

public final class NatAvatar: UIView {

    // MARK: - Private properties
    
    internal let circleView: UIView = {
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
    
    private let iconView: IconView = {
        let iconView = IconView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.tintColor = getUIColorFromTokens(\.colorOnPrimary)
        return iconView
    }()

    internal let size: Size
    private let notificationCenter: NotificationCenterObservable

    // MARK: - Inits

    public convenience init(size: Size = .medium) {
        self.init(size: size, notificationCenter: NotificationCenter.default)
    }

    init(size: Size = .medium, notificationCenter: NotificationCenterObservable) {
        self.size = size
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
    
    public override func layoutSubviews() {
        circleView.layer.cornerRadius = size.value / 2
        label.font = size.font
    }
}

// MARK: - Public methods

extension NatAvatar {
    public func configure(initials: String) {
        label.text = initials.maxCharCount(2)
        
        imageView.isHidden = true
        label.isHidden = false
        iconView.isHidden = true
    }

    public func configure(image: UIImage?) {
        guard let image = image else {
            configureDefaultIcon()
            return
        }
        
        imageView.image = image
        
        imageView.isHidden = false
        label.isHidden = true
        iconView.isHidden = true
    }
    
    public func configure(icon: String?) {
        iconView.iconText = icon
        
        imageView.isHidden = true
        label.isHidden = true
        iconView.isHidden = false
    }
}

// MARK: - Private methods - UI

extension NatAvatar {
    private func setup() {
        addSubview(circleView)
        addSubview(label)
        addSubview(imageView)
        addSubview(iconView)
        
        iconView.shouldShowDefaultIcon = true

        addConstraints()

        notificationCenter.addObserver(
            self,
            selector: #selector(themeHasChanged),
            name: .themeHasChanged,
            object: nil
        )
    }
    
    private func configureDefaultIcon() {
        // TODO"
    }

    private func addConstraints() {
        let circleSize = size.value

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
            
            iconView.topAnchor.constraint(equalTo: circleView.topAnchor, constant: getTokenFromTheme(\.spacingTiny)),
            iconView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor, constant: -getTokenFromTheme(\.spacingTiny)),
            iconView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: -getTokenFromTheme(\.spacingTiny)),
            iconView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: getTokenFromTheme(\.spacingTiny)),
            
            label.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: circleView.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - NotificationCenter

extension NatAvatar {
    @objc private func themeHasChanged() {
        self.setup()
    }
}
