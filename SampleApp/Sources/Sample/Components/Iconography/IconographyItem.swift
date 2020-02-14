import NatDS

class IconographyItem: UIViewController, SampleItem {
    var name = "Iconography"
    var cellID = "CellID"

    private let icons: [Icon] = Icon.allCases

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        layout.itemSize = CGSize(width: 80, height: 80)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.register(IconCollectioViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        setup()
    }

    private func setup() {
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

extension IconographyItem: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        icons.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let view = collectionView.dequeueReusableCell(withReuseIdentifier: cellID,
                                                            for: indexPath) as? IconCollectioViewCell else {
                                                                return UICollectionViewCell()
        }
        view.icon = icons[indexPath.row]
        return view
    }
}
