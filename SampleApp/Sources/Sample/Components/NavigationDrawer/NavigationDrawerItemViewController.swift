import NatDS

class NavigationDrawerItemViewController: UIViewController, SampleItem {
    static var name = "Navigation Drawer"

    private lazy var headerView: UIView = {
        let header = UIView()
        header.frame.size.height = 120
        header.backgroundColor = NatColors.background

        let avatar = NatAvatar(size: .medium, type: .label)
        avatar.configure(name: "Design System")
        header.addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.leadingAnchor.constraint(equalTo: header.leadingAnchor,
                                        constant: NatSpacing.small).isActive = true
        avatar.topAnchor.constraint(equalTo: header.topAnchor,
                                    constant: NatSpacing.small).isActive = true

        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6, withWeight: .medium)
        label.text = "Custom header"
        header.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: header.leadingAnchor,
                                        constant: NatSpacing.small).isActive = true
        label.topAnchor.constraint(equalTo: avatar.bottomAnchor,
                                    constant: NatSpacing.small).isActive = true

        let divider = Divider()
        header.addSubview(divider)
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.leadingAnchor.constraint(equalTo: header.leadingAnchor).isActive = true
        divider.trailingAnchor.constraint(equalTo: header.trailingAnchor).isActive = true
        divider.topAnchor.constraint(equalTo: label.bottomAnchor,
                                     constant: NatSpacing.small).isActive = true

        return header
    }()

    private lazy var footerView: UIView = {
        let footer = UIView()
        footer.frame.size.height = 100
        footer.backgroundColor = NatColors.background

        let logo = NatLogo(size: .large)
        footer.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.centerYAnchor.constraint(equalTo: footer.centerYAnchor,
                                      constant: -NatSpacing.small).isActive = true
        logo.centerXAnchor.constraint(equalTo: footer.centerXAnchor).isActive = true

        let label = UILabel()
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
        label.text = "Custom footer"
        footer.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: logo.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: footer.bottomAnchor,
                                    constant: -NatSpacing.small).isActive = true
        return footer
    }()

    private var navigationDrawer = NavigationDrawer()
    private var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        setup()
        items = ItemFactory.build()
    }

    private func setup() {
        navigationDrawer = NavigationDrawer(headerView: headerView, footerView: footerView)
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
        if model.isSelected { item.state = .selected }
        if model.disabled { item.state = .disabled }
        if model.lowEmphasis { item.state = .lowEmphasis }
        if model.rightActionIcon { item.actionRight = .icon(getIcon(.outlinedContentFlower)) }
        if model.rightActionImage { item.actionRight = .image(UIImage(named: "ImageAreaPlaceholder")) }
        if model.leftActionImage { item.actionLeft = .image(UIImage(named: "ImageAreaPlaceholder")) }
        if model.titleRightActionPulse { item.actionTitleRight = .pulse }
        if model.titleRightActionDot { item.actionTitleRight = .dot }
        if model.titleRightActionIcon { item.actionTitleRight = .icon(getIcon(.filledActionAdd)) }
        item.dropdown = model.dropdown
        if model.typeTitle { item.type = .title }
    }

    func configureSubitem(_ subitem: NavigationDrawerSubitemCell, at index: NavigationDrawer.IndexMenu) {
        let model = items[index.item].subitems[index.subitem]
        subitem.title = model.label
        if model.disabled {
            subitem.state = .disabled
        }
    }
}

// swiftlint:disable function_body_length
private extension NavigationDrawerItemViewController {
    struct ItemFactory {
        static func build() -> [Item] {
            let items: [Item] = [
                Item(label: "Selected item", isSelected: true),
                Item(label: "Item with type 'menu item'"),
                Item(label: "Item with type 'title'",
                     typeTitle: true),
                Item(label: "Item with right icon",
                     rightActionIcon: true),
                Item(label: "Item with right image",
                     rightActionImage: true),
                Item(label: "Item with pulse",
                     titleRightActionPulse: true),
                Item(label: "Item with dot",
                     titleRightActionDot: true),
                Item(label: "Item with left image",
                     leftActionImage: true),
                Item(label: "Item with icon next to the title",
                     titleRightActionIcon: true),
                Item(label: "Item with subitems and no dropdown",
                     subitems: [
                        Subitem(label: "Subitem", disabled: false)
                     ],
                     dropdown: false),
                Item(label: "Item with no subitems",
                     icon: getIcon(.outlinedFinanceShoppingcart)),
                Item(label: "Item with tag",
                     icon: getIcon(.outlinedAlertInfo),
                     tagText: "New"),
                Item(label: "Item with very, very, very large title and tag",
                     icon: getIcon(.outlinedFinanceCards),
                     tagText: "New"),
                Item(label: "Item with one subitem",
                     icon: getIcon(.outlinedActionNewrequest),
                     lowEmphasis: true,
                     subitems: [
                        Subitem(label: "Subitem 2.1", disabled: false, icon: getIcon(.filledActionLove))
                ]),
                Item(label: "Item with very, very, very large title and tag",
                     icon: getIcon(.outlinedActionRequest),
                     tagText: "New",
                     subitems: [
                        Subitem(label: "Subitem 3.1", disabled: false),
                        Subitem(label: "Subitem 3.2", disabled: false),
                        Subitem(label: "Subitem 3.3", disabled: false)
                ]),
                Item(label: "Disabled item with no subitem",
                     icon: getIcon(.outlinedSocialGroupofpeople),
                     disabled: true),
                Item(label: "Disabled item with subitems",
                     icon: getIcon(.filledBrandNaturarosacea),
                     disabled: true,
                     tagText: "New",
                     subitems: [
                        Subitem(label: "Subitem 5.1", disabled: false),
                        Subitem(label: "Subitem 5.2", disabled: false)
                ]),
                Item(label: "Item with disabled subitem",
                     icon: getIcon(.outlinedPlaceBus),
                     subitems: [
                        Subitem(label: "Subitem 6.1", disabled: true),
                        Subitem(label: "Subitem 6.3", disabled: false),
                        Subitem(label: "Subitem 6.4", disabled: false)
                ]),
                Item(label: "Low emphasis item",
                     icon: getIcon(.outlinedActionHelp),
                     lowEmphasis: true),
                Item(label: "Low emphasis item with tag",
                     icon: getIcon(.outlinedActionLike),
                     lowEmphasis: true,
                     tagText: "New"),
                Item(label: "Low emphasis item with subitem",
                     icon: getIcon(.outlinedActionMic),
                     lowEmphasis: true,
                     subitems: [Subitem(label: "Subitem 9.1", disabled: false)])
            ]

            return items
        }
    }

    struct Item {
        let label: String
        let icon: String?
        let disabled: Bool
        let lowEmphasis: Bool
        let tagText: String?
        let subitems: [Subitem]
        let titleRightActionIcon: Bool
        let titleRightActionDot: Bool
        let titleRightActionPulse: Bool
        let leftActionImage: Bool
        let rightActionIcon: Bool
        let rightActionImage: Bool
        let dropdown: Bool
        let typeTitle: Bool
        let isSelected: Bool

        init(label: String,
             icon: String? = nil,
             disabled: Bool = false,
             lowEmphasis: Bool = false,
             tagText: String? = nil,
             subitems: [Subitem] = [],
             titleRightActionIcon: Bool = false,
             titleRightActionDot: Bool = false,
             titleRightActionPulse: Bool = false,
             leftActionImage: Bool = false,
             rightActionIcon: Bool = false,
             rightActionImage: Bool = false,
             dropdown: Bool = true,
             typeTitle: Bool = false,
             isSelected: Bool = false) {
            self.label = label
            self.icon = icon
            self.disabled = disabled
            self.lowEmphasis = lowEmphasis
            self.tagText = tagText
            self.subitems = subitems
            self.titleRightActionIcon = titleRightActionIcon
            self.titleRightActionDot = titleRightActionDot
            self.titleRightActionPulse = titleRightActionPulse
            self.leftActionImage = leftActionImage
            self.rightActionIcon = rightActionIcon
            self.rightActionImage = rightActionImage
            self.dropdown = dropdown
            self.typeTitle = typeTitle
            self.isSelected = isSelected
        }
    }

    struct Subitem {
        let label: String
        let disabled: Bool
        let icon: String?

        init(label: String,
             disabled: Bool,
             icon: String? = nil) {
            self.label = label
            self.icon = icon
            self.disabled = disabled
        }
    }
}
