public class ContainedButton: UIButton {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setTitle(_ title: String) {
        setTitle(title.uppercased(), for: .normal)
    }

    private func setup() {
        backgroundColor = Colors.primary
        setTitleColor(Colors.highEmphasis, for: .normal)
        titleLabel?.font = Fonts.button
        layer.cornerRadius = 4.0
        titleEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        setShadow()
    }

}

private extension ContainedButton {
    private func setShadow() {
        layer.shadowColor = Colors.highlight.withAlphaComponent(0.14).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
    }
}
