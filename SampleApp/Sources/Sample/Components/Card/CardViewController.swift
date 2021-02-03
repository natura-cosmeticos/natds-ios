import UIKit
import NatDS

final class CardViewController: UIViewController, SampleItem {
    static var name: String = "Card"

    var card = NatCard()

    private let containedButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Contained")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let containedButton2: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Contained")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    private func setup() {
        view.backgroundColor = .white
        view.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(containedButton)
        card.addSubview(containedButton2)

        let constraints = [
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.heightAnchor.constraint(equalToConstant: 200),
            card.widthAnchor.constraint(equalToConstant: 200),

            containedButton2.topAnchor.constraint(equalTo: containedButton.bottomAnchor, constant: 10),
            containedButton2.leadingAnchor.constraint(equalTo: card.leadingAnchor)

            ]

        NSLayoutConstraint.activate(constraints)
    }
}
