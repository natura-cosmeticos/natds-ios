import UIKit

/**
  ????

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public final class NatDialogController: UIViewController { //add View

    // MARK: - Private properties

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let containerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Inits

    init(views: UIView...) {
        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        modalTransitionStyle = UIModalTransitionStyle.crossDissolve

        setup()

        views.forEach { containerStackView.addArrangedSubview($0) }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        containerView.layer.cornerRadius = getTheme().borderRadius.medium
        containerView.backgroundColor = getTheme().colors.surface

        view.addSubview(containerView)


//        containerView.addSubview(titleLabel)
//
//        containerView.addSubview(bodyLabel)
//
//        containerView.addSubview(footerView)

        containerView.addSubview(containerStackView)

//        containerStackView.addArrangedSubview(TitleView())
//
//        containerStackView.addArrangedSubview(bodyLabel)
//
//        containerStackView.addArrangedSubview(FooterView())
        
        addConstraints()
    }

    private func addConstraints() {
        let minimumHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 100)
        minimumHeightConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -NatSpacing.small),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            minimumHeightConstraint,
            containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -NatSpacing.small),
            containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: NatSpacing.small),
        ])
    }
}

extension NatDialogController {
    final class TitleView: UIView {
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Title"
            label.textColor = getTheme().colors.onSurface
            label.translatesAutoresizingMaskIntoConstraints = false

            return label
        }()

        // MARK: - Inits

        init() {
            super.init(frame: .zero)

            setup()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setup() {
            addSubview(titleLabel)

            addConstraints()
        }

        private func addConstraints() {
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])
        }
    }
}

extension NatDialogController {
    final class BodyView: UIView {
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Some body!!"
            label.numberOfLines = 0
            label.textColor = getTheme().colors.onSurface
            label.translatesAutoresizingMaskIntoConstraints = false

            return label
        }()

        // MARK: - Inits

        init() {
            super.init(frame: .zero)

            setup()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setup() {
            addSubview(titleLabel)

            addConstraints()
        }

        private func addConstraints() {
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])
        }
    }
}

extension NatDialogController {
    final class FooterView: UIView {
        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = getTheme().spacing.small
            stackView.translatesAutoresizingMaskIntoConstraints = false

            return stackView
        }()

        private let firstButton: NatButton = {
            let button = NatButton(style: .contained)
            button.configure(title: "Some text")
            button.translatesAutoresizingMaskIntoConstraints = false

            return button
        }()

        private let secondButton: NatButton = {
            let button = NatButton(style: .outlined)
            button.configure(title: "Some text")
            button.translatesAutoresizingMaskIntoConstraints = false

            return button
        }()

        init() {
            super.init(frame: .zero)

            setup()

//            backgroundColor = .blue
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setup() {
            addSubview(stackView)

            stackView.insertArrangedSubview(firstButton, at: 0)
            stackView.insertArrangedSubview(secondButton, at: 0)

            addConstraints()
        }

        override func layoutSubviews() {
            super.layoutSubviews()

            print("StackView: \(stackView.frame.width)")
            print("view: \(frame.width)")

            if stackView.frame.width == frame.width {
                stackView.axis = .vertical
            }
        }


        private func addConstraints() {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
                stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),

                firstButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),
                secondButton.heightAnchor.constraint(equalToConstant: NatButton.Height.medium),
            ])
        }
    }
}

extension NatDialogController {
    public static var standartBuilder: StandartBuilder { .init() }
}

extension NatDialogController {
    struct ButtonAction {
        let title: String
        let action: () -> Void
    }

    public final class StandartBuilder {
        private var title: String?
        private var body: String?
        private var buttonActions: [ButtonAction] = []

        func setTitle(_ title: String) -> Self {
            self.title = title

            return self
        }

        func setBody(_ body: String) -> Self {
            self.body = body

            return self
        }

        func setButtonAction(title: String, action: @escaping () -> Void) -> Self {
            if buttonActions.count > 3 { //magic number
                fatalError("AAAAA")
//                return self
            }
            
            buttonActions.append(.init(title: title, action: action))

            return self
        }

        public func build() -> NatDialogController {
            NatDialogController(
                views: TitleView(), BodyView(), FooterView()
            )
        }
    }
}
