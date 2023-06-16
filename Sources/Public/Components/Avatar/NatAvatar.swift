/**
 NatAvatar is a class that represents a component from the Design System.
 The avatar colors change according to the current brand configured in the Design System.

 It has 3 styles:
 - Icon
 - Label
 - Image
 
 And 5 sizes:
 - standard
 - semi
 - semiX
 - medium
 - largeXXX
 
 The default size is `standard` and the default type is `Icon`.
 The component's size is not changeable.
 It's type can change according to the configuration methods called after its initialization.

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

    var circleView = UIView()

    var label = UILabel()

    internal let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var defaultIconView = UIImageView()

    var iconView = IconView()

    internal let size: Size
    internal var type: Types
    internal var theme: AvailableTheme
    internal var fallBackIcon: String?

    // MARK: - Inits

    public init(size: Size = .medium, type: Types = .icon, theme:AvailableTheme = .none) {
        self.size = size
        self.type = type
        self.theme = theme

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

        let text = name.count <= 2 ? name : name.initials
        label.attributedText = text.attributedStringWith(lineHeight: size.lineHeight, letterSpacing: size.letterSpacing)
        label.textAlignment = .center

        imageView.isHidden = false
        label.isHidden = false
        defaultIconView.isHidden = true
        iconView.isHidden = true
    }

    /// Sets an image for NatAvatar with `image` type
    /// - Parameter image: an UIImage with the image to be displayed.
    /// If image is `nil`, the component will show the default icon
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

    /// Sets a remote image for NatAvatar with `image` type
    /// - Parameter imageURL: a URL containing an image
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

    /// Configures an icon as a fallback. It will appear if the configuration with the remote image fails.
    /// - Parameter setFallbackIcon: An icon from NatDSIcons, which is sent as a string.
    /// Example: `getIcon(.outlinedDefaultMockup)`
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

    /// Sets an icon for NatAvatar with `icon` type
    /// - Parameter icon: An icon from NatDSIcons, which is sent as a string. Example: `getIcon(.outlinedDefaultMockup)`
    public func configure(icon: String?) {
        type = .icon
        iconView.iconText = icon
        iconView.isHidden = false

        defaultIconView.isHidden = true
        imageView.isHidden = true
        label.isHidden = true
    }

    /// Sets the default icon `outlinedDefaultMock` for NatAvatar.
    public func configureWithDefaultIcon() {
        type = .icon
        defaultIconView.isHidden = false

        imageView.isHidden = true
        label.isHidden = true
        iconView.isHidden = true
    }
}

// MARK: - Private methods

extension NatAvatar {
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

    private func setup() {
        
        circleView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            if (self.theme == .none) {
                view.backgroundColor = getUIColorFromTokens(\.colorPrimary)
            }
            else {
                view.backgroundColor = hexStringToUIColor(hex: self.theme.newInstance.tokens.colorPrimary)
            }
            return view
        }()
        
        label = {
           let label = UILabel()
            
            if (self.theme == .none) {
                label.textColor = getUIColorFromTokens(\.colorOnPrimary)
            }
            else {
                label.textColor = hexStringToUIColor(hex: self.theme.newInstance.tokens.colorOnPrimary)
            }
            
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

        defaultIconView = {
           let iconView = UIImageView()
           iconView.image = AssetsPath.iconOutlinedDefaultMockup.rawValue
            
            if (self.theme == .none) {
                iconView.tintedColor = getUIColorFromTokens(\.colorOnPrimary)
            }
            else {
                iconView.tintedColor = hexStringToUIColor(hex: self.theme.newInstance.tokens.colorOnPrimary)
            }
            
           iconView.translatesAutoresizingMaskIntoConstraints = false
           return iconView
       }()

        iconView = {
           let iconView = IconView(fontSize: NatSizes.standard)
            
            if (self.theme == .none) {
                iconView.tintColor = getUIColorFromTokens(\.colorOnPrimary)
            }
            else {
                iconView.tintColor = hexStringToUIColor(hex: self.theme.newInstance.tokens.colorOnPrimary)
            }
            
           iconView.translatesAutoresizingMaskIntoConstraints = false

           return iconView
       }()

        addSubview(circleView)
        addSubview(label)
        addSubview(iconView)
        addSubview(imageView)
        addSubview(defaultIconView)

        addConstraints()
    }

    private func addConstraints() {
        let constraints = [
            heightAnchor.constraint(equalToConstant: size.value),
            widthAnchor.constraint(equalToConstant: size.value),

            circleView.widthAnchor.constraint(equalToConstant: size.value),
            circleView.heightAnchor.constraint(equalToConstant: size.value),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),

            imageView.topAnchor.constraint(equalTo: circleView.topAnchor, constant: -2),
            imageView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 2),
            imageView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 2),
            imageView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: -2),

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
