import NatDS

class MainViewController: UIViewController {
    private let navigationDrawer = NavigationDrawer()
    private var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sample App"
        setup()
        items = ItemFactory.build()
    }

    private func setup() {
        addNavigationDrawer()
        navigationDrawer.delegate = self
    }

    private func addNavigationDrawer() {
        view.addSubview(navigationDrawer)
        navigationDrawer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationDrawer.topAnchor.constraint(equalTo: view.topAnchor),
            navigationDrawer.rightAnchor.constraint(equalTo: view.rightAnchor),
            navigationDrawer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            navigationDrawer.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}

extension MainViewController: NavigationDrawerDelegate {
    func numberOfItems() -> Int {
        return items.count
    }

    func numberOfSubitems(in item: Int) -> Int {
        return items[item].subitems.count
    }

    func didSelectItem(at index: Int) {
        print("didSelectItem: \(index)")

        if index == 0 {
            navigationController?.pushViewController(ValueTextHighlightViewController(), animated: true)
        }
    }

    func didSelectSubitem(at index: NavigationDrawer.IndexMenu) {
        print("didSelectSubitem: \(index.item),\(index.subitem)")

        if index.item == 1 && index.subitem == 0 {
            navigationController?.pushViewController(TextFieldViewController(), animated: true)
        }
    }

    func configureItem(_ item: NavigationDrawerItemCell, at index: Int) {
        item.title = items[index].label
        item.icon = .outlinedNavigationArrowleft
    }

    func configureSubitem(_ subitem: NavigationDrawerSubitemCell, at index: NavigationDrawer.IndexMenu) {
        subitem.title = items[index.item].subitems[index.subitem].label
    }
}

private extension MainViewController {
    struct ItemFactory {
        static func build() -> [Item] {
            var items = [Item]()

            items.append(Item(label: "Value Text Highlight", subitems: []))

            items.append(Item(label: "Fields", subitems: [
                Subitem(label: "TextField")
            ]))

            items.append(Item(label: "Item 3",
                              subitems: [Subitem(label: "Subitem 3.1"), Subitem(label: "Subitem 3.2")]))
            items.append(Item(label: "Item 4", subitems: []))

            return items
        }
    }

    struct Item {
        let label: String
        let subitems: [Subitem]
    }

    struct Subitem {
        let label: String
    }
}
