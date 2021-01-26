import UIKit

final class NatRadioButton: UIControl {

    var onTouchesBegan: ((Set<UITouch>) -> Void)?
    var onTouchesEnded: ((Set<UITouch>) -> Void)?

    var isHapticFeedbackEnabled: Bool = false

    private var style = Style.default
    private let increasedTouchRadius: CGFloat = 5
    private let notificationCenter: NotificationCenterObservable
    private var feedbackGenerator: UIImpactFeedbackGenerator?

    override var isSelected: Bool {
        didSet {
            self.setNeedsDisplay()
            super.isSelected = isSelected
        }
    }

    init(style: Style, notificationCenter: NotificationCenterObservable = NotificationCenter.default) {
        self.style = style
        self.notificationCenter = notificationCenter

        super.init(frame: .zero)

        setup()
    }

    override init(frame: CGRect = .zero) {
        self.style = Style.default
        self.notificationCenter = NotificationCenter.default
        super.init(frame: frame)

        setup()
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }

    private func setup() {
        backgroundColor = .clear

        notificationCenter.addObserver(
            self,
            selector: #selector(themeHasChanged),
            name: .themeHasChanged,
            object: nil
        )
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
        feedbackGenerator?.prepare()

        onTouchesBegan?(touches)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isSelected.toggle()
        sendActions(for: .valueChanged)

        if isHapticFeedbackEnabled {
            feedbackGenerator?.impactOccurred()
            feedbackGenerator = nil
        }

        onTouchesEnded?(touches)
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsets(top: -increasedTouchRadius,
                                             left: -increasedTouchRadius,
                                             bottom: -increasedTouchRadius,
                                             right: -increasedTouchRadius)
        let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }

    override func draw(_ rect: CGRect) {

        let borderWidth: CGFloat = 2
        //        let dxy = borderWidth
        //        let newRect = rect.insetBy(dx: dxy, dy: dxy)

        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(style.borderColor(isSelected, isEnabled: isEnabled).cgColor)
        context?.setLineWidth(borderWidth)

        let halfSize: CGFloat = min(bounds.size.width/2, bounds.size.height/2)

        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: halfSize, y: halfSize),
            radius: CGFloat(halfSize - (borderWidth/2)),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true)
        //            UIBezierPath(roundedRect: newRect, cornerRadius: 2)

        style.backgroundColor(isSelected, isEnabled: isEnabled).setFill()

       // circlePath.fill()

        context?.addPath(circlePath.cgPath)
        context?.strokePath()
        context?.fillPath()

        if isSelected {
            drawCheckmark(frame: rect)
        }
    }

    //swiftlint:disable line_length
    private func drawCheckmark(frame: CGRect) {
        //        let bezierPath = UIBezierPath()
        //        bezierPath.move(to: CGPoint(x: frame.minX + 0.26000 * frame.width, y: frame.minY + 0.50000 * frame.height))
        //        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.42000 * frame.width, y: frame.minY + 0.62000 * frame.height),
        //                            controlPoint1: CGPoint(x: frame.minX + 0.38000 * frame.width, y: frame.minY + 0.60000 * frame.height),
        //                            controlPoint2: CGPoint(x: frame.minX + 0.42000 * frame.width, y: frame.minY + 0.62000 * frame.height))
        //        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.70000 * frame.width, y: frame.minY + 0.24000 * frame.height))
        //        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.78000 * frame.width, y: frame.minY + 0.30000 * frame.height))
        //        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.44000 * frame.width, y: frame.minY + 0.76000 * frame.height))
        //        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.20000 * frame.width, y: frame.minY + 0.58000 * frame.height),
        //                            controlPoint1: CGPoint(x: frame.minX + 0.44000 * frame.width, y: frame.minY + 0.76000 * frame.height),
        //                            controlPoint2: CGPoint(x: frame.minX + 0.26000 * frame.width, y: frame.minY + 0.62000 * frame.height))
        ////
        //        let borderWidth: CGFloat = 2
        //        let halfSize: CGFloat = min(bounds.size.width/2, bounds.size.height/2)
        //
        //               let bezierPath = UIBezierPath(
        //                       arcCenter: CGPoint(x: halfSize, y: halfSize),
        //                       radius: CGFloat(halfSize - (borderWidth/2)),
        //                       startAngle: CGFloat(0),
        //                       endAngle: CGFloat(Double.pi * 3),
        //                       clockwise: true)
        //        bezierPath
        //        style.checkmarkColor.setFill()
        //        bezierPath.fill()

        let halfSize: CGFloat = min(bounds.size.width/2, bounds.size.height/2)
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: CGFloat(halfSize/2),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true)

        circlePath.fill()

    }
}

extension NatRadioButton {
    @objc internal func themeHasChanged() {
        style = Style.default
    }
}
