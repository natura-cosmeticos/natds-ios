import UIKit

/**
  ExpansionPanel is a class that represents a view component that can be expanded and collapsed.
  Also, it can show or hide a detail view with content.
  The panel expands and retracts as user touches an up/down button, and the border color changes according to the chosen Design System theme.

    Example of usage:

        let expansionPanel = ExpansionPanel()
        expansionPanel.setSubtitle("My Subtitle")
        expansionPanel.setDetailView(myDetailView)
        expansionPanel.setHandlerForTap(withAction: .expand) {
            // your code
        }
}

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public class ExpansionPanel: UIView {

    /// An enum that represents which actions performed by the component can receive a completion handler
    public enum ExpansionAction {
        case expand
        case collapse
        case allActions
    }

    public typealias ExpansionHandler = () -> Void

    private var expandHandler: ExpansionHandler?
    private var collapseHandler: ExpansionHandler?
    private var tapHandler: ExpansionHandler?

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = NatFonts.font(ofSize: .subtitle1, withWeight: .medium)
        label.textColor = NatColors.onSurface
        return label
    }()

    private lazy var upDownButton: UIButton = {
        let button = UIButton()
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        iconView.tintedColor = getUIColorFromTokens(\.colorHighEmphasis)
        button.tintColor = getUIColorFromTokens(\.colorOnBackground)
        button.addTarget(self, action: #selector(didTapUpDownButton), for: .touchUpInside)
        button.setImage(AssetsPath.iconOutlinedNavigationArrowBottom.rawValue, for: .normal)
        return button
    }()

    private var detailView: UIView? {
        willSet {
            detailView?.removeFromSuperview()
        }
        didSet {
            if detailView != nil {
                if isExpanded {
                    addDetailView()
                }
            } else {
                collapse()
            }
        }
    }

    private let viewAnimating: ViewAnimating
    private let notificationCenter: NotificationCenterObservable

    private var isExpanded: Bool { !isCollapsed }
    private var isCollapsed: Bool { upDownButton.transform == CGAffineTransform.identity }
    private let animationDuration = 0.5

    private var activeBorderColor = NatColors.primary
    private var inactiveBorderColor = UIColor.clear {
        didSet {
            layer.borderColor = inactiveBorderColor.cgColor
        }
    }

    // MARK: - Inits

    public convenience init() {
        self.init(viewAnimating: ViewAnimatingWrapper(), notificationCenter: NotificationCenter.default)
    }

    init(viewAnimating: ViewAnimating, notificationCenter: NotificationCenterObservable) {
        self.viewAnimating = viewAnimating
        self.notificationCenter = notificationCenter

        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Deinit

    deinit {
        notificationCenter.removeObserver(self)
    }

    // MARK: - Public methods

    /// Defines a text for the subtitle (the main text in the component)
    ///
    /// - Parameter subtitle: a string for the subtitle
    public func setSubtitle(_ subtitle: String, color: UIColor = NatColors.onSurface) {
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = color
    }

    /// Adds a detail view into the bottom content of the panel
    /// This detail view is going to be showed or hidden as the panel expands or collapses, respectively.
    ///
    /// - Parameter detailView: an UIView with your content
    public func setDetailView(_ detailView: UIView?) {
        self.detailView = detailView
    }

    /// Adds a completion handler to be executed when the component expands, collapses, or both
    ///
    /// - Parameters:
    ///   - action: the action that will be the trigger to execute the completion handler.
    ///   - completionHandler: the block of code to be run
    public func setHandlerForTap(withAction action: ExpansionAction, completionHandler: @escaping ExpansionHandler) {
        switch action {
        case .expand:
            self.expandHandler = completionHandler
        case .collapse:
            self.collapseHandler = completionHandler
        default:
            self.tapHandler = completionHandler
        }
    }

    /// Sets custom color for the component active and inactive borders
    ///
    /// - Parameters:
    ///   - active: an UIColor
    ///   - inactive: an UIColor
    public func setColorForBorders(active: UIColor, inactive: UIColor) {
        self.activeBorderColor = active
        self.inactiveBorderColor = inactive
    }

    // MARK: - User interactions

    @objc private func didTapUpDownButton() {
        toggle()
    }

    @objc private func didTapPanel() {
        toggle()
    }

    // MARK: - Private methods

    private func setup() {
        backgroundColor = NatColors.surface
        NatElevation.apply(on: self, elevation: .micro)
        layer.cornerRadius = NatBorderRadius.medium
        layer.borderWidth = 1
        layer.borderColor = inactiveBorderColor.cgColor
        addTapToToggle()
        addSubviews()
        setLayout()

        notificationCenter.addObserver(
            self,
            selector: #selector(themeHasChanged),
            name: .themeHasChanged,
            object: nil
        )
    }

    private func toggle() {
        isCollapsed ? expand() : collapse()
    }

    private func addTapToToggle() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapPanel))
        addGestureRecognizer(tap)
    }

    // MARK: - Private methods - UI

    private func addSubviews() {
        addSubview(subtitleLabel)
        addSubview(upDownButton)
    }

    private func setLayout() {
        setSubtitleLabelLayout()
        setUpDownButtonLayout()
    }

    private func setSubtitleLabelLayout() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: NatSpacing.small),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: NatSpacing.standard),
            subtitleLabel.trailingAnchor.constraint(equalTo: upDownButton.leadingAnchor, constant: -NatSpacing.small),
            subtitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: NatSizes.standard)
        ])
        let bottomConstraint = subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -NatSpacing.small)
        bottomConstraint.priority = .defaultLow
        bottomConstraint.isActive = true
    }

    private func setUpDownButtonLayout() {
        upDownButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upDownButton.widthAnchor.constraint(equalToConstant: NatSizes.standard),
            upDownButton.heightAnchor.constraint(equalToConstant: NatSizes.standard),
            upDownButton.topAnchor.constraint(equalTo: subtitleLabel.topAnchor),
            upDownButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -NatSpacing.small)
        ])
    }

    private func updateBorderColor() {
        isExpanded ? setBorderColorActive() : setBorderColorInactive()
    }

    private func addDetailView() {
        guard let detailView = detailView else { return }
        addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: NatSpacing.small),
            detailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: NatSpacing.standard),
            detailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -NatSpacing.standard),
            detailView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -NatSpacing.standard)
        ])
    }

    private func removeDetailView() {
        detailView?.removeFromSuperview()
    }

}

// MARK: - Expand

extension ExpansionPanel {
    private func expand() {
        addDetailView()
        let previousHeight = frame.size.height
        layoutIfNeeded()
        rotateButtonUp()
        animateIncreasingHeight(from: previousHeight)
        animateIncreasingDetailHeight()
        animateChangingColorToActive()
        executeHandlerForExpand()
    }

    private func setBorderColorActive() {
        layer.borderColor = activeBorderColor.cgColor
    }

    private func animateChangingColorToActive() {
        animateChangingBorderColor(from: inactiveBorderColor, to: activeBorderColor)
        setBorderColorActive()
    }

    private func executeHandlerForExpand() {
        expandHandler?()
        tapHandler?()
    }
}

// MARK: - Collapse

extension ExpansionPanel {
    private func collapse() {
        removeDetailView()
        layoutIfNeeded()
        rotateButtonDown(animated: false)
        animateChangingColorToInactive()
        executeHandlerForCollapse()
    }

    private func setBorderColorInactive() {
        layer.borderColor = inactiveBorderColor.cgColor
    }

    private func animateChangingColorToInactive() {
        animateChangingBorderColor(from: activeBorderColor, to: inactiveBorderColor)
        setBorderColorInactive()
    }

    private func executeHandlerForCollapse() {
        collapseHandler?()
        tapHandler?()
    }
}

// MARK: - Animations

extension ExpansionPanel {
    private func animateIncreasingHeight(from previousHeight: CGFloat) {
        let newHeight = frame.size.height
        self.height = previousHeight
        viewAnimating.animate(withDuration: animationDuration, animations: {
            self.height = newHeight
        })
    }

    private func animateIncreasingDetailHeight() {
        guard let detailView = detailView else { return }
        let newContentHeight = detailView.frame.height
        increaseViewFromHalfHeight(detailView, with: newContentHeight)
        detailView.alpha = 0.0
        let halfAnimationDuration = animationDuration / 2.0
        viewAnimating.animate(withDuration: halfAnimationDuration,
                              delay: halfAnimationDuration,
                              options: .allowAnimatedContent) {
            detailView.alpha = 1.0
            self.detailView?.height = newContentHeight
        }
    }

    private func increaseViewFromHalfHeight(_ view: UIView, with height: CGFloat) {
        view.height = height / 2.0
    }

    private func rotateButtonUp() {
        viewAnimating.animate(withDuration: animationDuration) {
            self.upDownButton.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }

    private func rotateButtonDown(animated: Bool = true) {
        if animated {
            viewAnimating.animate(withDuration: animationDuration, animations: {
                self.upDownButton.transform = CGAffineTransform(rotationAngle: .pi * -2.0)
            }, completion: { (_) in
                self.upDownButton.transform = CGAffineTransform.identity
            })
        } else {
            self.upDownButton.transform = CGAffineTransform.identity
        }
    }

    private func animateDecreasingHeight(from previousHeight: CGFloat) {
        let newHeight = frame.size.height
        self.height = previousHeight
        viewAnimating.animate(withDuration: animationDuration) {
            self.height = newHeight
        }
    }

    private func animateChangingBorderColor(from sourceColor: UIColor, to targetColor: UIColor) {
        let animation = CABasicAnimation(keyPath: "borderColor")
        animation.fromValue = sourceColor
        animation.toValue = targetColor
        animation.duration = animationDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "color")
    }
}

// MARK: - NotificationCenter

extension ExpansionPanel {
    @objc private func themeHasChanged() {
        updateBorderColor()
    }
}
