import UIKit

/**
 NatSwitch is a class that represents the switch component from the design system.
 The switch colors changes according with the current theme configured in the Design System.
 
 Example of usage:

 natSwitch.configure(state: .normal)
 natSwitch.configure(state: .focused)
 natSwitch.configure(state: .disabled)
 
 natSwitch.configure(isOn: true)
 natSwitch.configure(isOn: false)
 
 natSwitchconfigure(isOnHandler:  { isOn in
    // Code
 })

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

 DesignSystem().configure(with: AvailableTheme)
 */

public class NatSwitch: UIView {

    private let thumbView: UIView = {
        let thumbView = UIView()
        thumbView.heightAnchor.constraint(equalToConstant: NatSizes.small).isActive = true
        thumbView.widthAnchor.constraint(equalToConstant: NatSizes.semi).isActive = true
        thumbView.layer.cornerRadius = NatSizes.tiny
        thumbView.translatesAutoresizingMaskIntoConstraints = false
        return thumbView
    }()

    private lazy var circleView: UIView = {
        let circleView = UIView()
        circleView.heightAnchor.constraint(equalToConstant: NatSizes.standard).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: NatSizes.standard).isActive = true
        circleView.layer.cornerRadius = NatBorderRadius.circle(viewHeight: NatSizes.standard)
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(tapHandler(gesture:)))
        tapGesture.minimumPressDuration = .zero
        circleView.addGestureRecognizer(tapGesture)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NatElevation.apply(on: circleView, elevation: .small)
        return circleView
    }()

    private let highlightCircleView: UIView = {
        let highlightCircleView = UIView()
        highlightCircleView.heightAnchor.constraint(equalToConstant: NatSizes.semiX).isActive = true
        highlightCircleView.widthAnchor.constraint(equalToConstant: NatSizes.semiX).isActive = true
        highlightCircleView.layer.cornerRadius = NatBorderRadius.circle(viewHeight: NatSizes.semiX)
        highlightCircleView.translatesAutoresizingMaskIntoConstraints = false
        return highlightCircleView
    }()

    private lazy var circleViewLeadingConstraint = {
        return circleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: NatSpacing.tiny)
    }()

    private lazy var circleViewTrailingConstraint = {
        return circleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -NatSpacing.tiny)
    }()

    private lazy var highlightCircleViewLeadingConstraint = {
        return highlightCircleView.leadingAnchor.constraint(equalTo: leadingAnchor)
    }()

    private lazy var highlightCircleViewTrailingConstraint = {
        return highlightCircleView.trailingAnchor.constraint(equalTo: trailingAnchor)
    }()

    public private(set) var isOn: Bool = false {
        didSet {
            animate()
            isOnHandler?(isOn)
        }
    }

    public private(set) var state: UIControl.State = .normal {
        didSet {
            setupUI()
        }
    }

    private var isOnHandler: ((Bool) -> Void)?

    public init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(thumbView)
        insertSubview(highlightCircleView, aboveSubview: thumbView)
        insertSubview(circleView, aboveSubview: highlightCircleView)
        addConstraints()
        setupUI()
    }

    private func addConstraints() {
        thumbView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: NatSpacing.standard/2).isActive = true
        thumbView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -NatSpacing.standard/2).isActive = true
        thumbView.topAnchor.constraint(equalTo: topAnchor, constant: NatSpacing.standard/2).isActive = true
        thumbView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -NatSpacing.standard/2).isActive = true

        circleView.topAnchor.constraint(equalTo: topAnchor, constant: NatSpacing.tiny).isActive = true

        highlightCircleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    private func setupUI() {
        switch state {
        case .normal:
            thumbView.backgroundColor = isOn ? NatColors.primary : NatColors.mediumEmphasis
            thumbView.alpha = isOn ? NatOpacities.medium : NatOpacities.opaque
            circleView.backgroundColor = isOn ? NatColors.primary : NatColors.surface
            highlightCircleView.isHidden = true
        case .disabled:
            thumbView.backgroundColor = NatColors.lowEmphasis
            thumbView.alpha = NatOpacities.opaque
            circleView.backgroundColor = NatColors.surface
            highlightCircleView.isHidden = true
        case .focused:
            thumbView.backgroundColor = isOn ? NatColors.primary : NatColors.mediumEmphasis
            thumbView.alpha = isOn ? NatOpacities.medium : NatOpacities.opaque
            circleView.backgroundColor = isOn ? NatColors.primary : NatColors.surface
            highlightCircleView.backgroundColor = isOn ? NatColors.primary : NatColors.highlight
            highlightCircleView.alpha = NatOpacities.low
            highlightCircleView.isHidden = false
        default:
            state = .normal
        }

        circleViewLeadingConstraint.isActive = !isOn
        circleViewTrailingConstraint.isActive = isOn

        highlightCircleViewLeadingConstraint.isActive = !isOn
        highlightCircleViewTrailingConstraint.isActive = isOn
    }

    private func animate() {
        UIView.animate(withDuration: 0.5,
                       delay: .zero,
                       options: [.curveEaseOut, .beginFromCurrentState],
                       animations: {
            self.setupUI()
        }, completion: nil)
    }

    @objc private func tapHandler(gesture: UITapGestureRecognizer) {
        if state != .disabled {
            if gesture.state == .began {
                highlightCircleView.backgroundColor = isOn ? NatColors.primary : NatColors.highlight
                highlightCircleView.alpha = NatOpacities.mediumLow
                highlightCircleView.isHidden = false
            } else if gesture.state == .ended {
                isOn.toggle()
            }
        }
    }

    // MARK: - Public Methods

    /// Attribute that sets the state of the component.
    public func configure(state: UIControl.State) {
        self.state = state
    }

    /// Attribute that sets and checks if the component is on.
    public func configure(isOn: Bool) {
        self.isOn = isOn
    }

    /// Sets the handler to be executed when `isOn` value changes
    ///
    /// Example of usage:
    /// ```
    /// natSwitch.configure { isOn in }
    /// ```
    /// - Parameter isOnHandler: A closure to notify value change
    public func configure(isOnHandler: @escaping (Bool) -> Void) {
        self.isOnHandler = isOnHandler
    }
}
