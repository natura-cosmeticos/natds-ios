import UIKit
import NatDS

class CounterViewController: UIViewController, SampleItem {
    static var name: String = "Counter"

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.semi
        stackView.distribution = .equalCentering
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    let enableMediumCounter: NatCounter = {
        let counter = NatCounter(size: .medium)
        counter.translatesAutoresizingMaskIntoConstraints = false

        return counter
    }()

    let enableMediumCounterWithLabel: NatCounter = {
        let counter = NatCounter(size: .medium)
        counter.configure(label: "All Enabled Medium")
        counter.configureKeyboard(state: .disabled)
        counter.translatesAutoresizingMaskIntoConstraints = false
        
        return counter
    }()

    let subtractDisabledMediumCounter: NatCounter = {
        let counter = NatCounter(size: .medium)
        counter.configure(label: "Subtract Disabled Medium")
        counter.configure(button: .subtract, state: .disabled)
        counter.translatesAutoresizingMaskIntoConstraints = false

        return counter
    }()

    let addDisabledSemiCounter: NatCounter = {
        let counter = NatCounter(size: .semi)
        counter.configure(label: "Add Disabled Semi")
        counter.configure(button: .add, state: .disabled)
        counter.translatesAutoresizingMaskIntoConstraints = false

        return counter
    }()

    let allDisabledSemiCounter: NatCounter = {
        let counter = NatCounter(size: .semi)
        counter.configure(label: "All Disabled Semi")
        counter.configure(button: .all, state: .disabled)
        counter.translatesAutoresizingMaskIntoConstraints = false

        return counter
    }()

    override func viewDidLoad() {
        title = Self.name
        view.backgroundColor = NatColors.background
        setup()
        setupHandlers()
    }

    private func setup() {
        view.addSubview(stackView)

        stackView.addArrangedSubview(enableMediumCounter)
        stackView.addArrangedSubview(enableMediumCounterWithLabel)
        stackView.addArrangedSubview(subtractDisabledMediumCounter)
        stackView.addArrangedSubview(addDisabledSemiCounter)
        stackView.addArrangedSubview(allDisabledSemiCounter)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupHandlers() {
        enableMediumCounter.configure { value in
            let alert = UIAlertController(title: "Taps",
                                          message: "You've selected number \(value)",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
