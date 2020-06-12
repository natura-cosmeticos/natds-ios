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

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "AHosdhio oIHDiosaHd SIDHAOSDHoi ASHDIoADsho DOIAHo hOhd AOHD IAOHD IOHDSOIHD oIHDAO DHOI HOIASHD oIDH oASH Doaish ohdo ah doAHDOI "
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let footerView: FooterView = {
        let view = FooterView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Inits

    public init() {
        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        modalTransitionStyle = UIModalTransitionStyle.crossDissolve

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.addSubview(containerView)

        containerView.backgroundColor = .red


        containerView.addSubview(titleLabel)

        containerView.addSubview(bodyLabel)

        containerView.addSubview(footerView)
        
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -NatSpacing.small),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.small),

            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            //Title
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
//            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),


            //Body
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
//            bodyLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),

            //Footer
            footerView.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 24),
            footerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            footerView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -16),
            footerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        ])
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
            button.configure(title: "Some text big big big text here")
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

            backgroundColor = .blue
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
