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
        BoxShadow.setBoxShadow02(layer)
    }

}
