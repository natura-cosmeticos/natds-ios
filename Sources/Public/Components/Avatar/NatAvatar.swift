/**
 NatAvatar is a class that represents a component from the Design System.
 The avatar colors change according to the current brand configured in the Design System.

 It has 3 styles:
 - Icon
 - Letter
 - Image
 
 And 5 sizes:
 - standard
 - semi
 - semiX
 - medium
 - largeXXX
 
 The default size is `standard` and the default type is `Icon`.
 The component's size is not changeable, but it's type can change according to the configuration methods called after its initialization.

 Example of usage:
 
        // using default configuration:
        let avatar = NatAvatar()
        // or:
        let avatar = NatAvatar(size: .medium, style: .image)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.
 
        DesignSystem().configure(with: AvailableTheme)
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
    
    private var defaultIconView: UIImageView = {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = AssetsPath.iconOutlinedSocialPerson.rawValue
        iconView.tintedColor = getUIColorFromTokens(\.colorOnPrimary)
        return iconView
    }()

    internal let size: Size
    internal var style: Style
    private let notificationCenter: NotificationCenterObservable

    // MARK: - Inits

    public convenience init(size: Size = .standard, style: Style = .icon) {
        self.init(size: size, style: style, notificationCenter: NotificationCenter.default)
    }

    init(size: Size = .standard, style: Style = .icon, notificationCenter: NotificationCenterObservable) {
        self.size = size
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()

        circleView.layer.cornerRadius = size.value / 2
        imageView.layer.cornerRadius = size.value / 2
        label.font = size.font
    }
}

// MARK: - Public methods

extension NatAvatar {
    /// Sets the label text for NatAvatar with `letter` type
    /// - Parameter name: a string with the full name for the avatar or the initials with 2 characters. If the name has more than 2 words, the initials will be the first letter from the first and last names
    public func configure(name: String) {
        style = .letter
        
        label.text = name.count <= 2 ? name : name.initials
        
        imageView.isHidden = true
        label.isHidden = false
        defaultIconView.isHidden = true
    }
    
    /// Sets an image for NatAvatar with `image` type
    /// - Parameter image: an UIImage with the image to be displayed. If image is `nil`, the component will show the default icon
    public func configure(image: UIImage?) {
        style = .image
        guard let image = image else {
            configureWithDefaultIcon()
            return
        }
        imageView.image = image
        
        imageView.isHidden = false
        label.isHidden = true
        defaultIconView.isHidden = true
    }
    
    /// Sets the default icon for NatAvatar with `icon` type. The icon cannot be customized
    public func configureWithDefaultIcon() {
        style = .icon
        defaultIconView.isHidden = false
        imageView.isHidden = true
        label.isHidden = true
    }
}

// MARK: - Private methods - UI

extension NatAvatar {
    private func setup() {
        addSubview(circleView)
        addSubview(label)
        addSubview(imageView)
        addSubview(defaultIconView)

        addConstraints()
        if style == .icon {
            configureWithDefaultIcon()
        }

        notificationCenter.addObserver(
            self,
            selector: #selector(themeHasChanged),
            name: .themeHasChanged,
            object: nil
        )
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
            
            defaultIconView.topAnchor.constraint(equalTo: circleView.topAnchor,
                                                 constant: getTokenFromTheme(\.spacingTiny)),
            defaultIconView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor,
                                                    constant: -getTokenFromTheme(\.spacingTiny)),
            defaultIconView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor,
                                                      constant: -getTokenFromTheme(\.spacingTiny)),
            defaultIconView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor,
                                                     constant: getTokenFromTheme(\.spacingTiny)),
            
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
