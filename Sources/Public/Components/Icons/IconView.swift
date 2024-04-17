/**
 IconView is a class that helps the usage of icons with the Design System, as an `UIView` that displays an icon.
 The icons are not available with `NatDS`; it's necessary to use the icon library `NatDSIcons`.
 
 Example of usage:
 
        let iconView = IconView()
 
 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.
        
        DesignSystem().configure(with: AvailableTheme)
 */

public class IconView: UIView {
    
    private var iconSize: CGSize = CGSize(width: 24, height: 24)
    
    private var widthConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?

    /// The alignment of the icon inside the view
    public var aligment: NSTextAlignment = .center {
        didSet {
            iconLabel.textAlignment = aligment
        }
    }

    /// The string that comes from `NatDSIcons` and it's translated as an icon
    public var iconText: String? {
        didSet {
            updateIconDisplay()
        }
    }

    private func updateIconDisplay() {
        let iconName = iconText?.isEmpty == false ? iconText : "outlined-default-mockup"
        if let image = AssetsHelper.image(from: iconName!)?.withRenderingMode(.alwaysTemplate) {
            defaultImageView.image = image
            defaultImageView.tintedColor = tintColor
            defaultImageView.isHidden = false
        } else {
            defaultImageView.image = AssetsHelper.image(from: "outlined-default-mockup")?.withRenderingMode(.alwaysTemplate)
            defaultImageView.tintedColor = tintColor
            defaultImageView.isHidden = false
        }
        iconLabel.isHidden = true
    }

    /// Sets if should show a default icon or a customized icon
    public var shouldShowDefaultIcon = true {
        didSet {
            setup()
            if !shouldShowDefaultIcon {
                defaultImageView.removeFromSuperview()
            } else {
                iconLabel.removeFromSuperview()
            }
        }
    }

    internal lazy var iconLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = aligment
        label.isHidden = true
        return label
    }()

    internal lazy var defaultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = AssetsHelper.image(from: "outlined-default-mockup")
        return imageView
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public convenience init(fontSize: CGFloat, icon: String? = nil) {
        self.init()
        defer { self.iconText = icon }
        iconLabel.font = .iconFont(ofSize: fontSize)
    }

    public convenience init(_ icon: String? = nil) {
        self.init()
        defer { self.iconText = icon }
        iconLabel.font = .iconFont()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func tintColorDidChange() {
        super.tintColorDidChange()
        iconLabel.textColor = tintColor
        defaultImageView.tintColor = tintColor
    }

    private func setup() {
        addSubview(defaultImageView)
        addSubview(iconLabel)
        
        widthConstraint = defaultImageView.widthAnchor.constraint(equalToConstant: iconSize.width)
        heightConstraint = defaultImageView.heightAnchor.constraint(equalToConstant: iconSize.height)

        NSLayoutConstraint.activate([widthConstraint!, heightConstraint!])

        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        defaultImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconLabel.topAnchor.constraint(equalTo: topAnchor),
            iconLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            defaultImageView.topAnchor.constraint(equalTo: topAnchor),
            defaultImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            defaultImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            defaultImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        defaultImageView.isHidden = false
        iconLabel.isHidden = true
    }
    
    private func updateImageViewSizeConstraints() {
            NSLayoutConstraint.activate([
                defaultImageView.widthAnchor.constraint(equalToConstant: iconSize.width),
                defaultImageView.heightAnchor.constraint(equalToConstant: iconSize.height)
            ])
        }

    /// Atualiza o tamanho do ícone.
    public func setFontSize(size: CGFloat) {
        updateImageViewSizeConstraints()
    }
    
    func updateIconSize(to newSize: CGSize) {
        widthConstraint?.constant = newSize.width
        heightConstraint?.constant = newSize.height
        
        NSLayoutConstraint.activate([widthConstraint!, heightConstraint!])

        layoutIfNeeded()
    }
}
