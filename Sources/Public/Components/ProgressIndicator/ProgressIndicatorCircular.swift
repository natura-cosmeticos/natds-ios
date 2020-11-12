import Foundation
import UIKit

public class ProgressIndicatorCircular: UIView {

    private let circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = getTokenFromTheme(\.sizeMediumX) / 2
        //view.backgroundColor = .green
        view.layer.borderColor = getUIColorFromTokens(\.colorSurface).cgColor
        view.layer.borderWidth = 5
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    public init() {
        super.init(frame: .zero)
        //backgroundColor = .red
        addSubview(circleView)

        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleView.heightAnchor.constraint(equalToConstant: 60),
            circleView.widthAnchor.constraint(equalToConstant: 60)
        ])

        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")

            rotationAnimation.fromValue = CGFloat(Double.pi / 2)
            rotationAnimation.toValue = CGFloat(2.5 * Double.pi)
            rotationAnimation.repeatCount = Float.infinity
            rotationAnimation.duration = 3

        circleView.layer.add(rotationAnimation, forKey: "rotationAnimation")

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_ rect: CGRect) {
        backgroundColor?.setFill()
        UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).fill()
    }


    //    @IBInspectable var color: UIColor = .gray {
    //        didSet { setNeedsDisplay() }
    //    }
    //    @IBInspectable var gradientColor: UIColor = .white {
    //        didSet { setNeedsDisplay() }
    //    }
    //    @IBInspectable var ringWidth: CGFloat = 5
    //
    //    public var progress: CGFloat = 0 {
    //        didSet { setNeedsDisplay() }
    //    }
    //
    //    private var progressLayer = CAShapeLayer()
    //    private var backgroundMask = CAShapeLayer()
    //    private let gradientLayer = CAGradientLayer()
    //
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        backgroundColor = .red
    //        setupLayers()
    //        createAnimation()
    //    }
    //
    //    required init?(coder: NSCoder) {
    //        super.init(coder: coder)
    //        setupLayers()
    //        createAnimation()
    //    }
    //
    //    private func setupLayers() {
    //        backgroundMask.lineWidth = ringWidth
    //        backgroundMask.fillColor = nil
    //        backgroundMask.strokeColor = UIColor.black.cgColor
    //        layer.mask = backgroundMask
    //
    //        progressLayer.lineWidth = ringWidth
    //        progressLayer.fillColor = nil
    //
    //        layer.addSublayer(gradientLayer)
    //
    //        gradientLayer.mask = progressLayer
    //        gradientLayer.locations = [0.35, 0.5, 0.65]
    //    }
    //
    //    private func createAnimation() {
    //        // MARK: Rotation Animation
    //
    //        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
    //
    //        rotationAnimation.fromValue = CGFloat(Double.pi / 2)
    //        rotationAnimation.toValue = CGFloat(2.5 * Double.pi)
    //        rotationAnimation.repeatCount = Float.infinity
    //        rotationAnimation.duration = 4
    //
    //        gradientLayer.add(rotationAnimation, forKey: "rotationAnimation")
    //
    //        // MARK: Gradient Animation
    //        let startPointAnimation = CAKeyframeAnimation(keyPath: "startPoint")
    //        startPointAnimation.values = [CGPoint.zero, CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1)]
    //
    //        startPointAnimation.repeatCount = Float.infinity
    //        startPointAnimation.duration = 1
    //
    //        let endPointAnimation = CAKeyframeAnimation(keyPath: "endPoint")
    //        endPointAnimation.values = [CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint.zero]
    //
    //        endPointAnimation.repeatCount = Float.infinity
    //        endPointAnimation.duration = 1
    //
    //        gradientLayer.add(startPointAnimation, forKey: "startPointAnimation")
    //        gradientLayer.add(endPointAnimation, forKey: "endPointAnimation")
    //    }
    //
    //    public override func draw(_ rect: CGRect) {
    //        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2))
    //        backgroundMask.path = circlePath.cgPath
    //
    //        progressLayer.path = circlePath.cgPath
    //        progressLayer.lineCap = .round
    //        progressLayer.strokeStart = 0
    //        progressLayer.strokeEnd = progress
    //        progressLayer.strokeColor = UIColor.black.cgColor
    //
    //        gradientLayer.frame = rect
    //        gradientLayer.colors = [color.cgColor, gradientColor.cgColor, color.cgColor]
    //    }
}
