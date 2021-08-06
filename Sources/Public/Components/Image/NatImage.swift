import UIKit

public class NatImage: UIView {

    private var variant: ImageType = .standard
    private var fallbackImage: UIImage?

    private lazy var imageView: NatGradientImageView = {
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

    public func configure(variant: ImageType) {
        self.variant = variant
        self.configure(setOverlay: variant == .highlight)
    }

    public func configureRadius(_ radius: ImageRadius = .none) {
        layoutIfNeeded()
        layer.cornerRadius = radius.value
        clipsToBounds = true
    }

    public func configureFade(_ fade: ImageFadeDirection = .bottom) {
        layoutIfNeeded()
        imageView.hasGradient = true
        imageView.gradientDirection = fade
    }

    public func configure(fallback: UIImage?) {
        self.fallbackImage = fallback
    }

    public func configure(setBorderRadius: Bool) {
        if setBorderRadius {
            self.layoutIfNeeded()
            layer.cornerRadius = getTokenFromTheme(\.borderRadiusMedium)
            clipsToBounds = true
        } else {
            layer.cornerRadius = 0
        }
    }

    public func configure(setOverlay: Bool) {
        if setOverlay {
            overlay.layer.backgroundColor = NatColors
                .highlight
                .withAlphaComponent(getTokenFromTheme(\.opacityMedium))
                .cgColor
            setFullConstraints(to: overlay)
        } else {
            overlay.layer.backgroundColor = UIColor.clear.cgColor
        }
    }

    public func configure(setImage: UIImage?) {
        imageView.image = setImage
    }

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
}
