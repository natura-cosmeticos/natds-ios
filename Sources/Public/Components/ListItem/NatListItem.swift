/**
 NatListItemCell is a class that representes the component List Item from Natura Design System.
 It inherits from UITableViewCell, being used inside UITableViews.
 It has the basic behavior for table cells according to the Design System:
     - a predefined selected color overlay
     - a ripple effect on touch
     - and a bottom divider
 
    Example of usage:
 
            tableView.register(NatListItemCell.self, forCellReuseIdentifier: "id")
            cell.configure(onClick: false)
            cell.configure(divider: .inset)
 
    NatListItemCell can also be used as a base for your custom cell:
 
         class CustomCell: NatListItemCell {
            // your custom code for the cell
         }

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

    // MARK: - Overrides

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

        if !isSelected && onClick {
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

    // MARK: - Public methods

    /// Sets if the cell is clicable or not.
    /// - Parameter onClick: a bool that indicates if the cell is clicable
    public func configure(onClick: Bool) {
        self.onClick = onClick
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
}

// MARK: - Pulsable

extension NatListItemCell: Pulsable {}
