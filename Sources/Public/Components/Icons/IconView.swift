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

    /// The alignment of the icon inside the view
    public var aligment: NSTextAlignment = .center {
        didSet {
            iconLabel.textAlignment = aligment
        }
    }

    /// The string that comes from `NatDSIcons` and it's translated as an icon
    public var iconText: String? {
        didSet {
            iconLabel.text = iconText
            if iconText != nil {
                shouldShowDefaultIcon = false
            }
        }
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
        label.font = .iconFont()
        return label
    }()

    internal lazy var defaultImageView: UIImageView = {
        let imageView = UIImageView()
        let image = AssetsPath.iconOutlinedDefaultMockup.rawValue
        imageView.image = image
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

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func tintColorDidChange() {
        super.tintColorDidChange()
        iconLabel.textColor = tintColor
        defaultImageView.tintedColor = tintColor
    }

    public func setFontSize(size: UIFont) {
        iconLabel.font = .iconFont(ofSize: size.pointSize)
    }

    private func setup() {
        addSubview(iconLabel)
        addSubview(defaultImageView)
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
    }
}
