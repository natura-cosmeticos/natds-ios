import UIKit

/**
  ????

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public final class NatDialogView: UIViewController { //add View

    // MARK: - Private properties

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.text = " AHosdhio oIHDiosaHd SIDHAOSDHoi ASHDIoADsho DOIAHo hOhd AOHD IAOHD IOHDSOIHD oIHDAO DHOI HOIASHD oIDH oASH Doaish ohdo ah doAHDOI "
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
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


        containerView.addSubview(bodyLabel)

            // Footer
        containerView.addSubview(buttonsStackView)
        buttonsStackView.insertArrangedSubview(firstButton, at: 0)
        buttonsStackView.insertArrangedSubview(secondButton, at: 0)



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

//            containerView.heightAnchor.constraint(equalToConstant: 20),


            bodyLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            bodyLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),

            //Footer
            buttonsStackView.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            buttonsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
//            buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
    }
}
