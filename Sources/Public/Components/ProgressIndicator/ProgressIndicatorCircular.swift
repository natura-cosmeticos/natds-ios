import Foundation
import UIKit

public class ProgressIndicatorCircular: UIView {
    private var circle = UIBezierPath()
    private var semiCircleLayer = CAShapeLayer()

    public init() {
        super.init(frame: .zero)
       layer.addSublayer(semiCircleLayer)
        isProgressHidden()
        semiCircleLayer.add(rotationAnimation(), forKey: "rotationAnimation")
    }

    // MARK: - Private Methods

    private func rotationAnimation() -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = CGFloat(Double.pi / 2)
        rotationAnimation.toValue = CGFloat(Double.pi * 2.5)
        rotationAnimation.repeatCount = Float.infinity
        rotationAnimation.duration = 1

        return rotationAnimation
    }

    private func createSemiCircle(semiCircleLayer: CAShapeLayer) {
        circle = UIBezierPath(
            arcCenter: CGPoint.zero,
            radius: NatSizes.standard,
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 2.5),
            clockwise: true
        )

        semiCircleLayer.path = circle.cgPath
        semiCircleLayer.strokeColor = getUIColorFromTokens(\.colorPrimary).cgColor
        semiCircleLayer.fillColor = .none
        semiCircleLayer.lineWidth = 4
    }

    // MARK: - Public Methods

    public func configure() {
        createSemiCircle(semiCircleLayer: semiCircleLayer)
    }

    public func isProgressHidden(_ isProgressIndicatorHidden: Bool = false) {
        if isProgressIndicatorHidden {
            removeFromSuperview()
        } else {
            layer.addSublayer(semiCircleLayer)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
