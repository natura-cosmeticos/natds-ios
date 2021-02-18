import UIKit
import NatDS

final class CardViewController: UIViewController, SampleItem {
    static var name: String = "Card"

    var card = NatCard()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    private func setup() {
        view.backgroundColor = NatColors.background
        view.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.configure(elevation: true)
        card.configure(borderRadius: true)

        let constraints = [
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.heightAnchor.constraint(equalToConstant: 200),
            card.widthAnchor.constraint(equalToConstant: 200)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
