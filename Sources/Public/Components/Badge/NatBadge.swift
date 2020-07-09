import UIKit

public final class NatBadge: UIView {

    // MARK: - Public properties

    public var text: String? {
        didSet {
            if case .standard = style {
                label.string = text
                shape.path = path
            }
        }
    }

    // MARK: - Private properties

    private let style: Style

    private let color: Color

    private lazy var shape: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.fillColor = color.cgColors.shape
        return shape
    }()

    private lazy var label: CATextLayer = {
        let label = CATextLayer()
        label.alignmentMode = CATextLayerAlignmentMode.center
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
        label.fontSize = getTheme().font.sizes.caption
        label.foregroundColor = color.cgColors.content
        label.contentsScale = UIScreen.main.scale
        return label
    }()

    private var path: CGPath {
        switch style {
        case .standard:
            let cornerRadius = NatBorderRadius.circle(viewHeight: getTheme().sizes.medium)
            let origin = CGPoint(x: frame.width - label.frame.width * 0.5, y: -label.frame.height * 0.5)
            label.frame = CGRect(origin: CGPoint(x: origin.x - NatSizes.micro * 0.5, y: origin.y),
                                 size: label.preferredFrameSize())
            return UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: origin.x - NatSizes.micro, y: origin.y),
                                                    size: CGSize(width: label.frame.width + NatSizes.micro, height: label.frame.height)),
                                cornerRadius: cornerRadius).cgPath
        }
    }

    // MARK: - Inits

    public init(style: Style, color: Color) {
        self.style = style
        self.color = color
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        backgroundColor = .clear
        if case .standard = style {
            shape.addSublayer(label)
        }
        layer.addSublayer(shape)
    }

    // MARK: - Public methods

    override public func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        shape.path = path
    }
}
