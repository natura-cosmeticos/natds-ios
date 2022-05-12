import NatDS
import UIKit

class SwitchViewController: UIViewController, SampleItem {
    static var name = "Switch"

    // MARK: - Private properties

    private let standardLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body1)
        label.text = "Standard"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let standardSwitch: NatSwitch = {
        let natSwitch = NatSwitch()
        natSwitch.translatesAutoresizingMaskIntoConstraints = false
        return natSwitch
    }()

    private let standardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let focusedLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body1)
        label.text = "Focused"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let focusedSwitch: NatSwitch = {
        let natSwitch = NatSwitch()
        natSwitch.configure(state: .focused)
        natSwitch.translatesAutoresizingMaskIntoConstraints = false
        return natSwitch
    }()

    private let focusedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let disabledOnLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body1)
        label.text = "Disabled on"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let disabledOnSwitch: NatSwitch = {
        let natSwitch = NatSwitch()
        natSwitch.configure(state: .disabled)
        natSwitch.configure(isOn: true)
        natSwitch.translatesAutoresizingMaskIntoConstraints = false
        return natSwitch
    }()

    private let disabledOnStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let disabledOffLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body1)
        label.text = "Disabled off"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let disabledOffSwitch: NatSwitch = {
        let natSwitch = NatSwitch()
        natSwitch.configure(state: .disabled)
        natSwitch.configure(isOn: false)
        natSwitch.translatesAutoresizingMaskIntoConstraints = false
        return natSwitch
    }()

    private let disabledOffStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.small
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupHandlers()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background
        view.addSubview(verticalStackView)

        standardStackView.addArrangedSubview(standardSwitch)
        standardStackView.addArrangedSubview(standardLabel)

        focusedStackView.addArrangedSubview(focusedSwitch)
        focusedStackView.addArrangedSubview(focusedLabel)

        disabledOnStackView.addArrangedSubview(disabledOnSwitch)
        disabledOnStackView.addArrangedSubview(disabledOnLabel)

        disabledOffStackView.addArrangedSubview(disabledOffSwitch)
        disabledOffStackView.addArrangedSubview(disabledOffLabel)

        verticalStackView.addArrangedSubview(standardStackView)
        verticalStackView.addArrangedSubview(focusedStackView)
        verticalStackView.addArrangedSubview(disabledOnStackView)
        verticalStackView.addArrangedSubview(disabledOffStackView)

        addConstraints()
    }

    private func setupHandlers() {
        standardSwitch.configure { isOn in
            let alert = UIAlertController(title: "Taps",
                                          message: "It's marked as \(isOn)",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

        focusedSwitch.configure { isOn in
            let alert = UIAlertController(title: "Taps",
                                          message: "It's marked as \(isOn)",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    private func addConstraints() {

        let constraints = [
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
