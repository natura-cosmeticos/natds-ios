/**
 NatListItemCell is a class that representes the component List Item from Natura Design System.
 It inherits from UITableViewCell, being used inside UITableViews.
 
 It has the basic behavior for table cells according to the Design System:
     - a predefined selected color overlay
     - a ripple effect on touch
     - and a bottom divider
 
 NatListItemCell should be used as a base for your custom cell:
 
         class CustomCell: NatListItemCell {
            // your code for custom cell
 
             override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                super.init(style: style, reuseIdentifier: reuseIdentifier)
                // your code for initializing custom cell
                commonInit()
             }
         }

 - Important:
 To create a custom cell that inherits from NatListItemCell, you should follow the steps:
 
    1. Create your custom cell with custom views
    2. Override the function `init(style:, reuseIdentifier:)`
    3. Call `commonInit()` inside the override

 Otherwise, the cell will not have the expected behavior for a NatListItemCell.

 - Requires:
    It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
 */

open class NatListItemCell: UITableViewCell {

    // MARK: - Attributes

    private var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = getUIColorFromTokens(\.colorPrimary).withAlphaComponent(getTokenFromTheme(\.opacityLow))
        return view
    }()

    private var divider: Divider = {
        let divider = Divider()
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()

    internal var onClick: Bool = false
    var feedbackStyle: FeedbackStyle = .ripple

    // MARK: - Init
    /**
     Call this method in methods `init(style: UITableViewCellStyle, reuseIdentifier: String?)` after creating views
     */
    @objc open func commonInit() {
        setup()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    // MARK: - Overrides

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected && onClick {
            overlayView.backgroundColor = getUIColorFromTokens(\.colorPrimary)
                .withAlphaComponent(getTokenFromTheme(\.opacityMediumLow))
        } else {
            overlayView.backgroundColor = .clear
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if !isSelected && onClick && feedbackStyle == .ripple {
            if let touch = touches.first {
                let point = touch.location(in: self)
                addPulseLayerAnimated(at: point, in: self.contentView.layer, removeAfterAnimation: true)
            }
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        removePulseLayer(layer: self.contentView.layer)
    }

    // MARK: - Public methods

    /// Sets if the cell is clicable or not.
    /// - Parameter onClick: a bool that indicates if the cell is clicable
    public func configure(onClick: Bool) {
        self.onClick = onClick
    }

    /// Sets the feedback style for the cell after the touch.
    /// - Parameter feedbackStyle: an option from `FeedbackStyle` enum
    public func configure(feedbackStyle: FeedbackStyle) {
        self.feedbackStyle = feedbackStyle
    }

    /// Sets the divider style for the cell. By default, the cell doesn't have a divider
    /// To use the divider, you must configure your tableView as `tableView.separatorStyle = .none`
    /// - Parameter divider: an option from divider styles enum
    public func configure(divider: Divider.Styles) {
        self.divider.configure(style: divider)
        addDivider()
    }

    /// Removes the divider from the cell
    public func configureRemoveDivider() {
        if contentView.subviews.contains(divider) {
            divider.removeFromSuperview()
        }
    }

    // MARK: - Private methods

    private func setup() {
        backgroundColor = getUIColorFromTokens(\.colorBackground)
        contentView.backgroundColor = getUIColorFromTokens(\.colorBackground)
        selectionStyle = .none
        setupOverlay()
    }

    private func setupOverlay() {
        addSubview(overlayView)
        bringSubviewToFront(overlayView)
        overlayView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        overlayView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        overlayView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        overlayView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    private func addDivider() {
        contentView.addSubview(divider)
        divider.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        divider.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        divider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

// MARK: - Pulsable

extension NatListItemCell: Pulsable {}
