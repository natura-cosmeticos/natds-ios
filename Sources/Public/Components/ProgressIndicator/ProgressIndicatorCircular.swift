import Foundation
import UIKit

public class ProgressIndicatorCircular: UIView {
    private var circle = UIBezierPath()
    private var semiCircleLayer = CAShapeLayer()
    private let circleView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    public init() {
        super.init(frame: .zero)
        circleView.layer.addSublayer(semiCircleLayer)
        addSubview(circleView)
        setupConstraints()
        isProgressHidden()
        semiCircleLayer.add(rotationAnimation(), forKey: "rotationAnimation")
    }

    // MARK: - Private Methods

    private func rotationAnimation() -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = CGFloat(Double.pi / 2)
        rotationAnimation.toValue = CGFloat(Double.pi * 2.5)
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

    private func createSemiCircle(semiCircleLayer: CAShapeLayer, radiusSize: CGFloat) {
        circle = UIBezierPath(
            arcCenter: CGPoint.zero,
            radius: radiusSize,
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

    public func configure(radiusSize: CGFloat = NatSizes.standard) {
        createSemiCircle(semiCircleLayer: semiCircleLayer, radiusSize: radiusSize)
    }

    public func isProgressHidden(isProgressIndicatorHidden: Bool = false) {
        if isProgressIndicatorHidden {
            circleView.removeFromSuperview()
        } else {
            addSubview(circleView)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}