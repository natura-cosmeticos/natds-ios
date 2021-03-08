import NatDS
import UIKit

final class RadioButtonViewController: UIViewController, SampleItem {

    static let name = "RadioButton"

    // MARK: - Private properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let enabledUnselectedRadioButton: NatSelectionControl = {
        let radioButton = NatSelectionControl(style: .radioButton)
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let enabledSelectedRadioButton: NatSelectionControl = {
        let radioButton = NatSelectionControl(style: .radioButton)
        radioButton.isSelected = true
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let disabledUnselectedRadioButton: NatSelectionControl = {
        let radioButton = NatSelectionControl(style: .radioButton)
        radioButton.isSelected = false
        radioButton.isEnabled = false
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let disabledSelectedRadioButton: NatSelectionControl = {
        let radioButton = NatSelectionControl(style: .radioButton)
        radioButton.isSelected = true
        radioButton.isEnabled = false
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let enabledUnselectedLabelRadioButton: NatSelectionControl = {
        let radioButton = NatSelectionControl(style: .radioButton, text: "Enabled unselected with label")
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let enabledSelectedLabelRadioButton: NatSelectionControl = {
        let radioButton = NatSelectionControl(style: .radioButton, text: "Enabled selected with label")
        radioButton.isSelected = true
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let disabledUnselectedLabelRadioButton: NatSelectionControl = {
        let radioButton = NatSelectionControl(style: .radioButton, text: "Disabled unselected with label")
        radioButton.isSelected = false
        radioButton.isEnabled = false
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    private let disabledSelectedLabelRadioButton: NatSelectionControl = {
        let radioButton = NatSelectionControl(style: .radioButton, text: "Disabled selected with label")
        radioButton.isSelected = true
        radioButton.isEnabled = false
        radioButton.translatesAutoresizingMaskIntoConstraints = false

        return radioButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)

        containerView.addSubview(stackView)

        stackView.addArrangedSubview(enabledUnselectedRadioButton)
        stackView.addArrangedSubview(enabledSelectedRadioButton)
        stackView.addArrangedSubview(disabledUnselectedRadioButton)
        stackView.addArrangedSubview(disabledSelectedRadioButton)
        stackView.addArrangedSubview(enabledUnselectedLabelRadioButton)
        stackView.addArrangedSubview(enabledSelectedLabelRadioButton)
        stackView.addArrangedSubview(disabledUnselectedLabelRadioButton)
        stackView.addArrangedSubview(disabledSelectedLabelRadioButton)

        addConstraints()
    }
}

extension RadioButtonViewController {

    private func addConstraints() {
        let containerHeightConstraint = containerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        containerHeightConstraint.priority = .defaultLow

        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),

            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -NatSpacing.small),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: NatSpacing.small),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerHeightConstraint,

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.small),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.bottomAnchor.constraint(
                greaterThanOrEqualTo: containerView.bottomAnchor,
                constant: -NatSpacing.small
            )
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
