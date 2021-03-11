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
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var defaultIconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = AssetsPath.iconOutlinedDefaultMockup.rawValue
        iconView.tintedColor = getUIColorFromTokens(\.colorOnPrimary)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()

    private let iconView: IconView = {
        let iconView = IconView(fontSize: NatSizes.standard)
        iconView.tintColor = getUIColorFromTokens(\.colorOnPrimary)
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()

    internal let size: Size
    internal var type: Types
    internal var fallBackIcon: String?


    // MARK: - Inits



    public init(size: Size = .medium, type: Types = .icon) {
        self.size = size
        self.type = type

        super.init(frame: .zero)
        setup()
    }

    // MARK: - Deinit


    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        circleView.layer.cornerRadius = size.value / 2
        imageView.layer.cornerRadius = size.value / 2
        label.font = size.font
        iconView.setFontSize(size: size.font)
    }
}

// MARK: - Public methods

extension NatAvatar {



    /// Sets the label text for NatAvatar with `label` type
    /// - Parameter name: a string with the full name for the avatar or the initials with 2 characters.
    /// If the name has more than 2 words, the initials will be the first letter from the first and last names
    public func configure(name: String) {
        type = .label
        
        label.text = name.count <= 2 ? name : name.initials

        imageView.isHidden = false
        label.isHidden = false
        defaultIconView.isHidden = true
        iconView.isHidden = true
    }
    
    /// Sets an image for NatAvatar with `image` type
    /// - Parameter image: an UIImage with the image to be displayed. If image is `nil`, the component will show the default icon
    public func configure(image: UIImage?) {
        type = .image
        guard let image = image else {
            configureWithDefaultIcon()
            return
        }
        imageView.image = image
        
        imageView.isHidden = false
        label.isHidden = true
        defaultIconView.isHidden = true
        iconView.isHidden = true

    }

    public func configure(imageURL: URL?) {
        type = .image

        if let image = imageURL {

            do {
                _ = try Data(contentsOf: image)

                imageView.load(url: image)

                imageView.isHidden = false
                label.isHidden = true
                defaultIconView.isHidden = true
                iconView.isHidden = true

            } catch {
                defaultFallback(icon: fallBackIcon)
            }
        }
    }

    public func configure(setFallbackIcon: String?) {
        fallBackIcon = setFallbackIcon
        if let icon = fallBackIcon {
            configure(icon: icon)
            imageView.isHidden = false
            label.isHidden = true
            defaultIconView.isHidden = true
            iconView.isHidden = false
        } else {
            defaultFallback(icon: fallBackIcon)
        }
    }

    public func configure(icon: String?) {
        iconView.iconText = icon
    }

    /// Sets the default icon for NatAvatar with `icon` type. The icon cannot be customized
    public func configureWithDefaultIcon() {
        type = .icon
        defaultIconView.isHidden = false
        imageView.isHidden = true
        label.isHidden = true
        iconView.isHidden = true
    }

    private func defaultFallback(icon: String?) {
        if let icon = icon {
            configure(setFallbackIcon: icon)

            imageView.isHidden = true
            label.isHidden = true
            defaultIconView.isHidden = true
            iconView.isHidden = false
        } else {
            if let name = label.text {
                configure(name: name)

                imageView.isHidden = true
                label.isHidden = false
                defaultIconView.isHidden = true
                iconView.isHidden = true
            } else {
                configure(name: "NA")

                imageView.isHidden = true
                label.isHidden = false
                defaultIconView.isHidden = true
                iconView.isHidden = true
            }
        }
    }
}

// MARK: - Private methods - UI

extension NatAvatar {
    private func setup() {
        addSubview(circleView)
        addSubview(label)
        addSubview(iconView)
        addSubview(imageView)
        addSubview(defaultIconView)

        addConstraints()
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
                                                 constant: getTokenFromTheme(\.spacingMicro)),
            defaultIconView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor,
                                                    constant: -getTokenFromTheme(\.spacingMicro)),
            defaultIconView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor,
                                                      constant: -getTokenFromTheme(\.spacingMicro)),
            defaultIconView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor,
                                                     constant: getTokenFromTheme(\.spacingMicro)),

            iconView.topAnchor.constraint(equalTo: circleView.topAnchor,
                                          constant: getTokenFromTheme(\.spacingMicro)),
            iconView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor,
                                             constant: -getTokenFromTheme(\.spacingMicro)),
            iconView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor,
                                               constant: -getTokenFromTheme(\.spacingMicro)),
            iconView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor,
                                              constant: getTokenFromTheme(\.spacingMicro)),

            label.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: circleView.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
