import UIKit

/**
 DOCS
 */

public final class NatCounter: UIView {

//    let counterContainer: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        view.clipsToBounds = true
//        view.layer.cornerRadius = 5
//        view.layer.borderColor = NatColors.highEmphasis.cgColor
//        view.layer.borderWidth = 0.5
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
//
    let stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0.5
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
//
//    let subtractView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        return view
//    }()
//
    let labelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
//
//    let addView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
//
//    let subtractIconButton: NatIconButton = {
//        let iconButton = NatIconButton(style: .standardDefault)
//        iconButton.configure(iconImage: AssetsPath.iconOutlinedActionCheck.rawValue)
//        iconButton.translatesAutoresizingMaskIntoConstraints = false
//
//        return iconButton
//    }()
//
    let label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body2, withWeight: .regular)
        label.textColor = getUIColorFromTokens(\.colorHighEmphasis)
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
//
//    let addIconButton: NatIconButton = {
//        let iconButton = NatIconButton(style: .standardDefault)
//        iconButton.translatesAutoresizingMaskIntoConstraints = false
//
//        return iconButton
//    }()

        let subtractView: NatCounterButton = {
            let view = NatCounterButton()
            view.translatesAutoresizingMaskIntoConstraints = false

            return view
        }()

    let addView: NatCounterButton = {
        let view = NatCounterButton()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Inits

    public init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {

        addSubview(stackViewContainer)
        labelView.addSubview(label)
        stackViewContainer.addArrangedSubview(subtractView)
        stackViewContainer.addArrangedSubview(labelView)
        stackViewContainer.addArrangedSubview(addView)

        subtractView.configure {
            print("sub")
        }

        addView.configure {
            print("add")
        }

        subtractView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 5)
        addView.roundCorners(corners: [.topRight, .bottomRight], radius: 5)

        subtractView.configure(iconImage: AssetsPath.iconOutlinedActionCheck.rawValue)
        NSLayoutConstraint.activate([

             stackViewContainer.topAnchor.constraint(equalTo: topAnchor),
             stackViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
             stackViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
             stackViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            label.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: labelView.centerXAnchor)
         ])

    }

//    private func setup() {
//
//
//
//        addSubview(stackViewContainer)
//
//        stackViewContainer.addArrangedSubview(subtractView)
//        stackViewContainer.addArrangedSubview(labelView)
//        stackViewContainer.addArrangedSubview(addView)
//
//        subtractView.addSubview(subtractIconButton)
//        labelView.addSubview(label)
//        addView.addSubview(addIconButton)
//
//        NSLayoutConstraint.activate([
//
//            heightAnchor.constraint(equalToConstant: 40),
//            widthAnchor.constraint(equalToConstant: 104),
//
//            stackViewContainer.topAnchor.constraint(equalTo: topAnchor),
//            stackViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
//
//            subtractIconButton.widthAnchor.constraint(equalToConstant: 32),
//            subtractIconButton.heightAnchor.constraint(equalToConstant: 40),
//            subtractIconButton.centerYAnchor.constraint(equalTo: subtractView.centerYAnchor),
//            subtractIconButton.centerXAnchor.constraint(equalTo: subtractView.centerXAnchor),
//
//            label.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
//            label.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
//
//            addView.widthAnchor.constraint(equalToConstant: 32),
//            addView.heightAnchor.constraint(equalToConstant: 40),
//
//            addIconButton.topAnchor.constraint(equalTo: addView.topAnchor),
//            addIconButton.leadingAnchor.constraint(equalTo: addView.leadingAnchor),
//            addIconButton.trailingAnchor.constraint(equalTo: addView.trailingAnchor),
//            addIconButton.bottomAnchor.constraint(equalTo: addView.bottomAnchor)
//
//
////
////            addIconButton.centerYAnchor.constraint(equalTo: addView.centerYAnchor),
////            addIconButton.centerXAnchor.constraint(equalTo: addView.centerXAnchor)
//        ])
//    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {

        let path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: CGSize(width: 32, height: 40)),
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
