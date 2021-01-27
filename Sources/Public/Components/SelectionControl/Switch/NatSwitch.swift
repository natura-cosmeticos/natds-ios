import UIKit

final class NatSwitch: UIControl, Pulsable {
    var onTouchesBegan: ((Set<UITouch>) -> Void)?
    var onTouchesEnded: ((Set<UITouch>) -> Void)?

    var isHapticFeedbackEnabled: Bool = false
    private var feedbackGenerator: UIImpactFeedbackGenerator?
    
    private var style = Style.default
    private let notificationCenter: NotificationCenterObservable
    
    public var isOn = true
    public var animationDuration: Double = 0.5
    
    internal var thumbView = UIView(frame: CGRect.zero)
    fileprivate var backgroundView = UIView(frame: CGRect.zero)
    
    fileprivate var onPoint = CGPoint.zero
    fileprivate var offPoint = CGPoint.zero
    fileprivate var isAnimating = false
    
    public var padding: CGFloat = 1

    public var thumbCornerRadius: CGFloat = 0.5
    public var thumbSize = CGSize.zero
    
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
        if !isAnimating {
            updateViewsAfterToggle()
        }
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
    
    private func updateViewsAfterToggle() {
        backgroundView.backgroundColor = style.backgroundColor(isOn, isEnabled: isEnabled)
        thumbView.backgroundColor = style.thumbColor(isOn, isEnabled: isEnabled)
        
        let thumbSize = CGSize(width: getTokenFromTheme(\.sizeStandard), height: getTokenFromTheme(\.sizeStandard))
        let yPosition = (bounds.size.height - thumbSize.height)/2
        
        onPoint = CGPoint(x: bounds.size.width - thumbSize.width - padding, y: yPosition)
        offPoint = CGPoint(x: padding, y: yPosition)
        
        thumbView.frame = CGRect(origin: isOn ? onPoint : offPoint, size: thumbSize)
        thumbView.layer.cornerRadius = thumbSize.height * thumbCornerRadius
    }
    
    private func clearViews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func setup() {
        backgroundColor = .clear
        clearViews()
        clipsToBounds = false
        setupBackgroundView()
        setupThumbView()
    }
    
    private func setupBackgroundView() {
        addSubview(backgroundView)
        backgroundView.isUserInteractionEnabled = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -NatSpacing.micro).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: getTokenFromTheme(\.sizeSmall)).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backgroundView.layer.cornerRadius = getTokenFromTheme(\.sizeSmall)/2
        backgroundView.clipsToBounds = true
    }
    
    private func setupThumbView() {
        thumbView.layer.shadowColor = UIColor.black.cgColor
        thumbView.layer.shadowRadius = 1.5
        thumbView.layer.shadowOpacity = 0.4
        thumbView.layer.shadowOffset = CGSize(width: 0.75, height: 2)
        thumbView.backgroundColor = style.thumbColor(isOn, isEnabled: isEnabled)
        thumbView.isUserInteractionEnabled = false
        addSubview(thumbView)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        self.animate()
        return true
    }
}

extension NatSwitch {
    private func animate() {
        self.isOn = !self.isOn
        self.isAnimating = true
        UIView.animate(withDuration: self.animationDuration,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: [UIView.AnimationOptions.curveEaseOut,
                                 UIView.AnimationOptions.beginFromCurrentState],
                       animations: {
                        self.thumbView.frame.origin.x = self.isOn ? self.onPoint.x : self.offPoint.x
                        self.backgroundView.backgroundColor = self.style.backgroundColor(self.isOn, isEnabled: self.isEnabled)
                        self.thumbView.backgroundColor = self.style.thumbColor(self.isOn, isEnabled: self.isEnabled)
                       },
                       completion: { _ in
                        self.isAnimating = false
                        self.sendActions(for: UIControl.Event.valueChanged)
                       })
    }
}
