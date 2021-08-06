import UIKit

class NatGradientImageView: UIImageView {

    internal var hasGradient: Bool = false {
        didSet {
            setupGradientVisibility()
        }
    }

    private var colors: [CGColor] = [UIColor.black.cgColor,
                                     UIColor.clear.cgColor]

    internal var gradientDirection: NatImage.ImageFadeDirection = .bottom {
        didSet {
            setupGradientDirection()
        }
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.shouldRasterize = true
        return layer
    }()

    private lazy var gradientView: UIView = {
        return UIView()
    }()

    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        if superview != nil {
            setupGradientView()
            setupGradientDirection()
            setupGradientVisibility()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = gradientView.frame
    }

    private func setupGradientView() {
        addSubview(gradientView)
        gradientLayer.colors = colors

        guard let superview = gradientView.superview else { return }
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        gradientView.leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        gradientView.rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true

        gradientView.layer.addSublayer(gradientLayer)
    }

    private func setupGradientDirection() {
        switch gradientDirection {
        case .top:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        case .bottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        case .left:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        case .right:
            gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
        }
    }

    private func setupGradientVisibility() {
        gradientView.isHidden = !hasGradient
    }
}
