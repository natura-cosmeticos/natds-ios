import NatDS
import UIKit

final class SelectionControlViewController: UIViewController, SampleItem {

    static let name = "Selection Control"

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

    private let stackViewEnabledSelected: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -NatSpacing.small
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let stackViewEnabledUnselected: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -NatSpacing.small
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let stackViewDisabledUnselected: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -NatSpacing.small
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let stackViewDisabledSelected: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -NatSpacing.small
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let stackViewEnabledUnselectedLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -NatSpacing.small
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let stackViewEnabledSelectedLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -NatSpacing.small
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let stackViewDisabledUnselectedLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -NatSpacing.small
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let stackViewDisabledSelectedLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -NatSpacing.small
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let enabledUnselectedCheckbox: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledSelectedCheckbox: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.isSelected = true
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledUnselectedCheckbox: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.isSelected = false
        checkbox.isEnabled = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledSelectedCheckbox: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.isSelected = true
        checkbox.isEnabled = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledUnselectedLabelCheckbox: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledSelectedLabelCheckbox: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.isSelected = true
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledUnselectedLabelCheckbox: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.isSelected = false
        checkbox.isEnabled = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledSelectedLabelCheckbox: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.isSelected = true
        checkbox.isEnabled = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
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

        stackView.addArrangedSubview(stackViewEnabledUnselected)
        stackView.addArrangedSubview(stackViewEnabledSelected)
        stackView.addArrangedSubview(stackViewDisabledUnselected)
        stackView.addArrangedSubview(stackViewDisabledSelected)
        stackView.addArrangedSubview(stackViewEnabledUnselectedLabel)
        stackView.addArrangedSubview(stackViewEnabledSelectedLabel)
        stackView.addArrangedSubview(stackViewDisabledUnselectedLabel)
        stackView.addArrangedSubview(stackViewDisabledSelectedLabel)

        stackViewEnabledUnselected.addArrangedSubview(enabledUnselectedCheckbox)
        stackViewEnabledUnselected.addArrangedSubview(enabledUnselectedRadioButton)

        stackViewEnabledSelected.addArrangedSubview(enabledSelectedCheckbox)
        stackViewEnabledSelected.addArrangedSubview(enabledSelectedRadioButton)

        stackViewDisabledUnselected.addArrangedSubview(disabledUnselectedCheckbox)
        stackViewDisabledUnselected.addArrangedSubview(disabledUnselectedRadioButton)

        stackViewDisabledSelected.addArrangedSubview(disabledSelectedCheckbox)
        stackViewDisabledSelected.addArrangedSubview(disabledSelectedRadioButton)

        stackViewEnabledUnselectedLabel.addArrangedSubview(enabledUnselectedLabelCheckbox)
        stackViewEnabledUnselectedLabel.addArrangedSubview(enabledUnselectedLabelRadioButton)

        stackViewEnabledSelectedLabel.addArrangedSubview(enabledSelectedLabelCheckbox)
        stackViewEnabledSelectedLabel.addArrangedSubview(enabledSelectedLabelRadioButton)

        stackViewDisabledUnselectedLabel.addArrangedSubview(disabledUnselectedLabelCheckbox)
        stackViewDisabledUnselectedLabel.addArrangedSubview(disabledUnselectedLabelRadioButton)

        stackViewDisabledSelectedLabel.addArrangedSubview(disabledSelectedLabelCheckbox)
        stackViewDisabledSelectedLabel.addArrangedSubview(disabledSelectedLabelRadioButton)

        addConstraints()
    }
}

extension SelectionControlViewController {

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
