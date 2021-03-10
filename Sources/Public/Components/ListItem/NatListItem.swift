/**
 DOCS
 */
public final class NatListItemCell: UITableViewCell {
    
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
    
    // MARK: - Overrides
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            overlayView.backgroundColor = getUIColorFromTokens(\.colorPrimary)
                .withAlphaComponent(getTokenFromTheme(\.opacityMediumLow))
        } else {
            overlayView.backgroundColor = .clear
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if let touch = touches.first {
            let point = touch.location(in: self)
            addPulseLayerAnimated(at: point, in: self.contentView.layer, removeAfterAnimation: false)
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
    
    public func configure(onClick: Bool) {
        self.isUserInteractionEnabled = onClick
    }
    
    public func configure(divider: Divider.Styles) {
        self.divider.configure(style: divider)
        addDivider()
    }
    
    public func configureRemoveDivider() {
        if subviews.contains(divider) {
            divider.removeFromSuperview()
        }
    }
}

// MARK: - Pulsable

extension NatListItemCell: Pulsable {}
