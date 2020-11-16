import Foundation
import UIKit

public class ProgressIndicatorCircular: UIView {

    var circle = UIBezierPath()
    var semiCircleLayer = CAShapeLayer()

    private let circleView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    public init() {
        super.init(frame: .zero)
        configureSemiCircle(semiCircleLayer: semiCircleLayer)
        circleView.layer.addSublayer(semiCircleLayer)
        addSubview(circleView)
        setupConstraints()

        semiCircleLayer.add(rotationAnimation(), forKey: "rotationAnimation")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func rotationAnimation() -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")

        rotationAnimation.fromValue = CGFloat(Double.pi / 2)
        rotationAnimation.toValue = CGFloat(2.5 * Double.pi)
        rotationAnimation.repeatCount = Float.infinity
        rotationAnimation.duration = 3

        return rotationAnimation
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func configureSemiCircle(semiCircleLayer: CAShapeLayer) {
        circle = UIBezierPath(
            arcCenter: CGPoint.zero,
            radius: CGFloat(48),
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 2.5),
            clockwise: true
        )

        semiCircleLayer.strokeColor = UIColor.red.cgColor
        semiCircleLayer.path = circle.cgPath
        semiCircleLayer.strokeColor = getUIColorFromTokens(\.colorPrimary).cgColor
        semiCircleLayer.fillColor = .none
        semiCircleLayer.lineWidth = 4
        semiCircleLayer.strokeStart = 0
        semiCircleLayer.strokeEnd  = 1

    }

}
