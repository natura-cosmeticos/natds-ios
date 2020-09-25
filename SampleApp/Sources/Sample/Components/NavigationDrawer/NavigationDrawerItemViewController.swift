import NatDS

class NavigationDrawerItemViewController: UIViewController, SampleItem {
    static var name = "Navigation Drawer"

    private let navigationDrawer = NavigationDrawer()
    private var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
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

extension NavigationDrawerItemViewController: NavigationDrawerDelegate {
    func numberOfItems() -> Int {
        return items.count
    }

    func numberOfSubitems(in item: Int) -> Int {
        return items[item].subitems.count
    }

    func didSelectItem(at index: Int) {
        print("didSelectItem: \(index)")
    }

    func didSelectSubitem(at index: NavigationDrawer.IndexMenu) {
        print("didSelectSubitem: \(index.item),\(index.subitem)")
    }

    func configureItem(_ item: NavigationDrawerItemCell, at index: Int) {
        let model = items[index]
        item.title = model.label
        item.icon = model.icon
        item.tagText = model.tagText
        if model.disabled {
            item.state = .disabled
        }
    }

    func configureSubitem(_ subitem: NavigationDrawerSubitemCell, at index: NavigationDrawer.IndexMenu) {
        let model = items[index.item].subitems[index.subitem]
        subitem.title = model.label
        if model.disabled {
            subitem.state = .disabled
        }
    }
}

private extension NavigationDrawerItemViewController {
    struct ItemFactory {
        static func build() -> [Item] {
            let items: [Item] = [
                Item(label: "Item with no subitems",
                     icon: .outlinedFinanceShoppingcart),
                Item(label: "Item with tag",
                     icon: .outlinedAlertInfo,
                     tagText: "New"),
                Item(label: "Item with very, very, very large title and tag",
                     icon: .outlinedFinanceCards,
                     tagText: "New"),
                Item(label: "Item with one subitem",
                     icon: .outlinedActionNewrequest,
                     subitems: [
                        Subitem(label: "Subitem 2.1", disabled: false)
                ]),
                Item(label: "Item with subitems",
                     icon: .outlinedActionRequest,
                     tagText: "New",
                     subitems: [
                        Subitem(label: "Subitem 3.1", disabled: false),
                        Subitem(label: "Subitem 3.2", disabled: false),
                        Subitem(label: "Subitem 3.3", disabled: false)
                ]),
                Item(label: "Disabled item with no subitem",
                     icon: .outlinedSocialGroupofpeople,
                     disabled: true),
                Item(label: "Disabled item with subitems",
                     icon: .filledBrandNaturarosacea,
                     disabled: true,
                     tagText: "New",
                     subitems: [
                        Subitem(label: "Subitem 5.1", disabled: false),
                        Subitem(label: "Subitem 5.2", disabled: false)
                ]),
                Item(label: "Item with disabled subitem",
                     icon: .outlinedPlaceBus,
                     subitems: [
                        Subitem(label: "Subitem 6.1", disabled: true),
                        Subitem(label: "Subitem 6.3", disabled: false),
                        Subitem(label: "Subitem 6.4", disabled: false)
                ])
            ]

            return items
        }
    }

    struct Item {
        let label: String
        let icon: Icon
        let disabled: Bool
        let tagText: String?
        let subitems: [Subitem]

        init(label: String, icon: Icon, disabled: Bool = false, tagText: String? = nil, subitems: [Subitem] = []) {
            self.label = label
            self.icon = icon
            self.disabled = disabled
            self.tagText = tagText
            self.subitems = subitems
        }
    }

    struct Subitem {
        let label: String
        let disabled: Bool
    }
}
