import UIKit

/**
  ExpansionPanel is a class that represents  a  view component that can be expanded and collapsed.
  Also, it can show or hide a detail view
  This is a component from the design system.
  The panel expands and retracts as user touches the upDownButton,
  and the border color changes according to the current Brand configured in the Design system
  and according with user properties of Light and Dark mode.

    This panel has only 2 public methods to interact with:

    With this, you can define a text for the subtitle

        public func setSubtitle(_ subtitle: String)

    With that one, you can add a detail view into the bottom content of the panel
    This detail is going to be showed or hidden as the panel expands or collapses, respectively.

        public func setDetailView(_ detailView: UIView?)

    Example of usage:

        let expansionPanel = ExpansionPanel()
        expansionPanel.setSubtitle("My Subtitle")
        expansionPanel.setDetailView(myDetailView)

 - Requires:
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public class ExpansionPanel: UIView {

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = NatFonts.font(ofSize: .subtitle1, withWeight: .medium)
        label.textColor = NatColors.onSurface
        return label
    }()

    private lazy var upDownButton: UIButton = {
        let size: CGFloat = NatSizes.standard
        let button = UIButton(type: .system)
        button.tintColor = NatColors.onBackground
        button.titleLabel?.font = .iconFont(ofSize: size)
        button.setTitle(Icon.outlinedNavigationArrowbottom.unicode, for: .normal)
        button.layer.cornerRadius = NatBorderRadius.circle(viewHeight: size)
        button.addTarget(self, action: #selector(didTapUpDownButton), for: .touchUpInside)
        return button
    }()

    private lazy var contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        view.isLayoutMarginsRelativeArrangement = true
        return view
    }()

    private var detailView: UIView? {
        didSet {
            if let detailView = detailView {
                if isExpanded {
                    cleanContentView()
                    contentView.addArrangedSubview(detailView)
                }
            } else {
                collapse()
            }
        }
    }

    private let viewAnimating: ViewAnimating

    private var isExpanded: Bool { !isCollapsed }
    private var isCollapsed: Bool { upDownButton.transform == CGAffineTransform.identity }
    private let activeBorderColor = NatColors.primary
    private let inactiveBorderColor = UIColor.clear
    private let animationDuration = 0.5

    // MARK: - Inits

    public convenience init() {
        self.init(viewAnimating: ViewAnimatingWrapper())
    }

    init(viewAnimating: ViewAnimating) {
        self.viewAnimating = viewAnimating
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    public func setSubtitle(_ subtitle: String) {
        subtitleLabel.text = subtitle
    }

    public func setDetailView(_ detailView: UIView?) {
        self.detailView = detailView
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
        NatElevation.apply(on: self, elevation: .elevation01)
        layer.cornerRadius = NatBorderRadius.medium
        layer.borderWidth = 1
        layer.borderColor = inactiveBorderColor.cgColor
        addTapToToggle()
        addSubviews()
        setLayout()
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
        addSubview(contentView)
    }

    private func setLayout() {
        setSubtitleLabelLayout()
        setUpDownButtonLayout()
        setContentViewLayout()
    }

    private func setSubtitleLabelLayout() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: NatSpacing.small),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: NatSpacing.standart),
            subtitleLabel.trailingAnchor.constraint(equalTo: upDownButton.leadingAnchor, constant: -NatSpacing.small),
            subtitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: NatSizes.standard)
        ])
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

    private func setContentViewLayout() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: NatSpacing.small),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

// MARK: - Expand

extension ExpansionPanel {

    private func expand() {
        if let detailView = detailView {
            contentView.addArrangedSubview(detailView)
            expandContentView()
        }
        let previousHeight = frame.size.height
        layoutIfNeeded()
        rotateButtonUp()
        animateIncreasingHeight(from: previousHeight)
        animateIncreasingDetailHeight()
        animateChangingColorToActive()
    }

    private func setBorderColorActive() {
        layer.borderColor = activeBorderColor.cgColor
    }

    private func expandContentView() {
        contentView.layoutMargins = UIEdgeInsets(top: 0,
                                                 left: NatSpacing.standart,
                                                 bottom: NatSpacing.standart,
                                                 right: NatSpacing.standart)
    }

    private func animateChangingColorToActive() {
        animateChangingBorderColor(from: inactiveBorderColor, to: activeBorderColor)
        setBorderColorActive()
    }

}

// MARK: - Collapse

extension ExpansionPanel {

    private func collapse() {
        let previousHeight = frame.size.height
        collapseContentView()
        cleanContentView()
        layoutIfNeeded()
        rotateButtonDown()
        animateDecreasingHeight(from: previousHeight)
        animateChangingColorToInactive()
    }

    private func setBorderColorInactive() {
        layer.borderColor = inactiveBorderColor.cgColor
    }

    private func collapseContentView() {
        contentView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    private func cleanContentView() {
        contentView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    private func animateChangingColorToInactive() {
        animateChangingBorderColor(from: activeBorderColor, to: inactiveBorderColor)
        setBorderColorInactive()
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
        detailView.height = newContentHeight / 2.0
        detailView.alpha = 0.0
        let duration = animationDuration / 2.0
        let delay = duration
        viewAnimating.animate(withDuration: duration, delay: delay, options: .allowAnimatedContent) {
            detailView.alpha = 1.0
            self.detailView?.height = newContentHeight
        }
    }

    private func rotateButtonUp() {
        viewAnimating.animate(withDuration: animationDuration) {
            self.upDownButton.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }

    private func rotateButtonDown() {
        viewAnimating.animate(withDuration: animationDuration, animations: {
            self.upDownButton.transform = CGAffineTransform(rotationAngle: .pi * -2.0)
        }, completion: { (_) in
            self.upDownButton.transform = CGAffineTransform.identity
        })
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
