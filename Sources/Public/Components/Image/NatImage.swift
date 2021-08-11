import UIKit

public class NatImage: UIView {

    private(set) var variant: ImageType = .standard
    private(set) var fallbackImage: UIImage?

    private(set) lazy var imageView: NatGradientImageView = {
        let view = NatGradientImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var overlay: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Inits

    public init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    /// Sets the component with the chosen variant interface.
    ///
    /// - Parameter variant: an option from ImageType enum
    public func configure(variant: ImageType) {
        self.variant = variant
        self.configure(setOverlay: variant == .highlight)
    }

    /// Sets the value for the border radius. The radius is equally applied in all corners.
    /// If the chosen option is `circle`, the height of the view (a CGFloat) must be sent as a parameter.
    /// Default option is `none`.
    ///
    /// - Parameter radius: an option from ImageRadius enum
    public func configureRadius(_ radius: ImageRadius = .none) {
        layoutIfNeeded()
        layer.cornerRadius = radius.value
        clipsToBounds = true
    }

    /// Applies a fade overlay to the component and sets its direction.
    /// Default option is `bottom`.
    /// Option `none` is used to remove the fade overlay.
    ///
    /// - Parameter fade: an option from ImageFadeDirection enum
    public func configureFade(_ fade: ImageFadeDirection = .bottom) {
        layoutIfNeeded()
        if fade == .none {
            imageView.hasGradient = false
        } else {
            imageView.hasGradient = true
            imageView.gradientDirection = fade
        }
    }

    /// Sets an image as a fallback, which will be displayed if the configuration with an URL fails.
    ///
    /// - Parameter fallback: an UIImage
    public func configure(fallback: UIImage?) {
        self.fallbackImage = fallback
    }

    /// Configures the component with an image.
    ///
    /// - Parameter setImage: an UIImage
    public func configure(setImage: UIImage?) {
        imageView.image = setImage
    }

    /// Configures the content mode for the image.
    ///
    /// - Parameter contentMode: a contentMode option
    public func configure(contentMode: UIImageView.ContentMode) {
        imageView.contentMode = contentMode
    }

    /// Configures the component with an image from an URL.
    ///
    /// - Parameter setImageFromURL: an URL that loads an image
    public func configure(setImageFromURL: URL?) {
        if let image = setImageFromURL {
            do {
                _ = try Data(contentsOf: image)
                imageView.load(url: image)
            } catch {
                configure(setImage: fallbackImage)
            }
        } else {
            configure(setImage: fallbackImage)
        }
    }

    // MARK: - Private methods

    private func setup() {
        addSubview(imageView)
        setFullConstraints(to: imageView)
    }

    private func setFullConstraints(to object: AnyObject) {
        NSLayoutConstraint.activate([
            object.topAnchor.constraint(equalTo: topAnchor),
            object.bottomAnchor.constraint(equalTo: bottomAnchor),
            object.leadingAnchor.constraint(equalTo: leadingAnchor),
            object.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func configure(setOverlay: Bool) {
        if setOverlay {
            overlay.layer.backgroundColor = NatColors
                .highlight
                .withAlphaComponent(getTokenFromTheme(\.opacityMedium))
                .cgColor
            addSubview(overlay)
            setFullConstraints(to: overlay)
        } else {
            if subviews.contains(overlay) {
                overlay.removeFromSuperview()
            }
            overlay.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
}
