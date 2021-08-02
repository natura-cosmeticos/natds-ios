import UIKit

public class NatImage: UIView {

    private var variant: ImageType = .standard

    internal lazy var defaultImageView: UIImageView = {
        let imageView = UIImageView()
        let image = AssetsPath.iconOutlinedProductEmptyBackground.rawValue
        imageView.image = image

        return imageView
    }()

    // MARK: - Inits

    public init() {
        super.init(frame: .zero)
        addDefaultImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(variant: ImageType) {
            self.variant = variant
            self.configure(setOverlay: variant == .highlight)
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
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        addSubview(overlay)

        if setOverlay {
            overlay.layer.backgroundColor = NatColors
                .onSurface
                .withAlphaComponent(getTokenFromTheme(\.opacityMedium))
                .cgColor
            setFullConstraints(to: overlay)
        } else {
            overlay.layer.backgroundColor = UIColor.clear.cgColor
        }
    }

    public func configure(setImage: UIImage?) {
        defaultImageView.removeFromSuperview()

        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = setImage ?? defaultImageView.image

        addSubview(image)
        sendSubviewToBack(image)

        setFullConstraints(to: image)
    }

    private func addDefaultImage() {
        addSubview(defaultImageView)
        defaultImageView.translatesAutoresizingMaskIntoConstraints = false

        setFullConstraints(to: defaultImageView)
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
