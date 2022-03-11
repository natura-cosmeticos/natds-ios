final class HelperView: UIView {
    func addToView(_ view: UIView, constraintTo constraintView: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: constraintView.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: constraintView.centerXAnchor).isActive = true
        heightAnchor.constraint(equalTo: constraintView.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: constraintView.widthAnchor).isActive = true
        backgroundColor = .clear
    }
}

extension HelperView: Badgeable {}
