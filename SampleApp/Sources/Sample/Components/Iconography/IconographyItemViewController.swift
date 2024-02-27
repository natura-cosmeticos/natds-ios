import NatDS

class IconographyItemViewController: UIViewController, SampleItem {
    static var name = "Iconography"

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        layout.itemSize = CGSize(width: 80, height: 80)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.register(IconCollectionViewCell.self)
        collectionView.backgroundColor = .clear

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        setup()
    }
    
    private func getAllIcons() -> [String] {
        return Icon.allCases.map { $0.rawValue }.sorted()
    }

    private func setup() {
        view.backgroundColor = NatColors.background
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}

extension IconographyItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        getAllIcons().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as! IconCollectionViewCell
        let iconName = getAllIcons()[indexPath.row]
        if let iconEnum = Icon(rawValue: iconName) {
            cell.icon = getIcon(iconEnum)
            cell.iconName = iconName
        }
        return cell
    }

}
