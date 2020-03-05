public class ContainedButton: Button {

    public override var isEnabled: Bool {
        didSet {
            updateBackgroundByState()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        setTitleColor(Colors.Content.highEmphasis, for: .normal)
        setTitleColor(Colors.Content.highEmphasis.withAlphaComponent(0.24), for: .disabled)

        setShadow()
        updateBackgroundByState()
    }
}

private extension ContainedButton {

    private func setShadow() {
        layer.shadowColor = Colors.Content.highlight.withAlphaComponent(0.14).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
    }

    private func updateBackgroundByState() {
        switch self.state {
        case .disabled:
            backgroundColor = Colors.Content.highlight.withAlphaComponent(0.12)
        default:
            backgroundColor = Colors.primary
        }
    }
}
