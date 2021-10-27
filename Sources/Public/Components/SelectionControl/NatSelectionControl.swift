import UIKit
/**
 NatSelectionControl is a class that represents Design System's selection control component.
 The component colors changes according to the current theme configured in the Design System.
 
 The component has 2 styles:
 - checkbox
 - radio
 
 Example of usage:

        NatSelectionControl(style: .radioButton)
 
 And it can be configured with a label:

        NatSelectionControl(style: .checkbox, text: "The text for the label")

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.
 
        DesignSystem().configure(with: AvailableTheme)
 */

public class NatSelectionControl: UIView {

    public var handler: SelectionHandler? {
        get {
            selectorView.handler
        }
        set {
            selectorView.handler = newValue
        }
    }

    /// Attribute that sets and checks if the component is selected.
    public var isSelected: Bool {
        get {
            selectorView.isSelected
        }
        set {
            selectorView.isSelected = newValue
        }
    }

    /// Attribute that sets and checks if the component is enabled.
    public var isEnabled: Bool {
        get {
            selectorView.isEnabled
        }
        set {
            selectorView.isEnabled = newValue
        }
    }

    /// Attribute that sets and checks if haptic feedback for touch is enabled.
    public var isHapticFeedbackEnabled: Bool {
        get {
            selectorView.isHapticFeedbackEnabled
        }
        set {
            selectorView.isHapticFeedbackEnabled = newValue
        }
    }

    /// Attribute that sets and checks if indeterminate state is selected
    public var isIndeterminate: Bool {
        get {
            selectorView.isIndeterminate
        }
        set {
            selectorView.isIndeterminate = newValue
        }
    }

    public var labelComponent: String? {
        get {
            selectorView.labelComponent
        }
        set {
            selectorView.labelComponent = newValue ?? ""
        }
    }

    internal var isGrouped: Bool = false {
        didSet {
            selectorView.isGrouped = isGrouped
        }
    }

    internal var groupId: Int = 0 {
        didSet {
            selectorView.groupId = groupId
        }
    }

    private let style: Style
    private(set) var text: String?
    private var notificationCenter: NotificationCenterObservable

    private lazy var selectorView: NatSelector = {
        let view = style.getSelector()
        return view
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        return label
    }()

    public init(style: Style, text: String? = nil) {
        self.style = style
        self.text = text
        self.notificationCenter = NotificationCenter.default
        super.init(frame: .zero)
        setup()
    }

    init(style: Style,
         text: String? = nil,
         notificationCenter: NotificationCenterObservable = NotificationCenter.default) {

        self.notificationCenter = notificationCenter
        self.style = style
        self.text = text
        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    // MARK: - View Setup

    private func setup() {
        addSubview(selectorView)
        addSelectorConstraints()

        addSubview(label)
        addLabelConstraints()
        setupLabel()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }

    private func addSelectorConstraints() {
        selectorView.translatesAutoresizingMaskIntoConstraints = false
        selectorView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                              constant: getTokenFromTheme(\.spacingTiny)).isActive = true
        selectorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        selectorView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

    private func addLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: selectorView.trailingAnchor,
                                       constant: getTokenFromTheme(\.spacingMicro)).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: selectorView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

    public func configure(text: String?) {
        label.text = text
        labelComponent = text
    }

    private func setupLabel() {
        label.font = NatFonts.font(ofSize: style.fontSize,
                                   withWeight: style.fontWeight,
                                   withFamily: style.fontFamily)
        label.textColor = getUIColorFromTokens(\.colorHighEmphasis)
        if let text = text {
            label.attributedText = createLabelWithAttributes(text)
        }
    }

    private func createLabelWithAttributes(_ text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.apply(kernValue: style.letterSpacing)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = style.lineHeight
        attributedString.apply(paragraphStyle: paragraphStyle)

        return attributedString
    }
}
