import UIKit
import NatDS

class ImageViewController: UIViewController, SampleItem {
    static var name: String = "Image"

    let image = NatImage()
    let imageView = UIImageView()

    override func viewDidLoad() {
        title = Self.name
        view.backgroundColor = NatColors.background
        image.configure(setBorderRadius: true)
        setup()
    }

    private func setup() {
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
