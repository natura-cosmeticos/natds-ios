import UIKit

extension CustomSplashViewController {
    final class GradientBackgroundView: UIView {
        private let gradientLayer: CAGradientLayer = {
            let colorForTop = UIColor.clear.cgColor
            let colorForBottom = UIColor.black.cgColor

            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorForBottom, colorForTop]
            gradientLayer.locations = [0.0, 1]
            gradientLayer.startPoint = CGPoint(x: 0.65, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.65, y: 0)

            return gradientLayer
        }()

        init() {
            super.init(frame: .zero)

            layer.insertSublayer(gradientLayer, at: 0)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func layoutSubviews() {
            super.layoutSubviews()

            gradientLayer.frame = bounds
        }
    }
}
