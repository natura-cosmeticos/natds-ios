import Foundation
import UIKit

public class ProgressIndicatorCircular: UIView {

    private let circleView: UIView = {
        let view = UIView()
        //view.layer.cornerRadius = getTokenFromTheme(\.sizeMediumX) / 2
        view.backgroundColor = .green
//        view.layer.borderColor = getUIColorFromTokens(\.colorSurface).cgColor
//        view.layer.borderWidth = 5
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    var semiCircleLayer = CAShapeLayer()

    public init() {
        super.init(frame: .zero)
        //backgroundColor = .red
        addSubview(circleView)

        //Circle Points
        let center = CGPoint(x: circleView.frame.size.width / 2, y: circleView.frame.size.height / 2)
        let circleRadius = circleView.frame.size.width / 2
        let circlePath = UIBezierPath(
            arcCenter: center,
            radius: circleRadius,
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true
        )

        semiCircleLayer.path = circlePath.cgPath
        semiCircleLayer.strokeColor = UIColor.red.cgColor
        semiCircleLayer.fillColor = UIColor.blue.cgColor
        semiCircleLayer.lineWidth = 8
        semiCircleLayer.strokeStart = 0
        semiCircleLayer.strokeEnd  = 1
        circleView.layer.addSublayer(semiCircleLayer)

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
}
