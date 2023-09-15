/**
 - NOTE:
 This component is available in the following variants:
 - ✅ Base

 With the following attribute status:
 - Model:
    - ✅ `A`
    - ✅ `B`
 - Color:
    - ✅ `Neutral`
    - ✅ `Primary`
    - ✅ `Secondary`
    - ✅ `Highlight`
    - ✅ `Surface`
 - Size:
    - ✅ `Medium` to `Veryhuge`
 
 NatLogo represents Design System's `logo` component.
 The logo image changes according to the configured theme and it has different model, color and size options.
 The default model is `A`; the default size is `veryHuge`; and the default color is `neutral`.

 > Note: the size can only be changed at `init()`
 
 Example of usage:
        
        let logo = NatLogo(size: .medium)
        logo.configure(color: .primary)
        logo.configure(model: .modelB)

 - Requires:
    It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
 */

public final class NatLogo: UIView {

    private(set) var size: Size = .veryHuge

    var model: Model = .modelA {
        didSet {
            updateImage()
        }
    }

    var color: Color = .neutral {
        didSet {
            updateImage()
        }
    }
    
    var language: Language = .none

    private var logoImage: UIImage?

    lazy private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Inits

    public init(size: Size? = .veryHuge) {
        super.init(frame: .zero)
        self.size = size ?? .veryHuge
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        updateImage()
        addSubview(logoImageView)
        addConstraints()
    }

    private func addConstraints() {
        let constraints = [
            widthAnchor.constraint(equalToConstant: size.value),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoImageView.topAnchor.constraint(equalTo: topAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func updateImage() {
        let langSuffix = languageSuffix(for: language)
            
        if color == .neutral {
            logoImageView.image = model.neutralImage(with: langSuffix)
        } else {
            logoImageView.image = model.customImage(with: langSuffix)?.tintedWithColor(color.value)
        }
    }
    
    private func languageSuffix(for language: Language) -> String {
        switch language {
        case .none:
            return ""
        default:
            return language.rawValue
        }
    }

    // MARK: - Public methods

    /// Configures a model for the logo
    /// - Parameter model: an option from `Model` enum
    public func configure(model: Model, lang: Language = .none) {
        self.language = lang
        self.model = model
    }

    /// Configures a color for the logo
    /// - Parameter color: an option from `Color` enum
    public func configure(color: Color) {
        self.color = color
    }
}
