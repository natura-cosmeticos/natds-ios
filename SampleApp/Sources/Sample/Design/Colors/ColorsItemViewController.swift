import NatDS

class ColorsItemViewController: UIViewController, SampleItem {
    static var name = "Colors"
    var cellID = "CellID"

    private let colors: [DSColor] = [
        ("Primary", Colors.primary),
        ("Secondary", Colors.secondary),
        ("High Emphasis", Colors.highEmphasis),
        ("Low Emphasis", Colors.lowEmphasis),
        ("Surface Dark", Colors.surfaceDark),
        ("Highlight", Colors.highlight)
    ]

    private lazy var collectionView: UICollectionView = {
        let halfScreenWidth = UIScreen.main.bounds.width / 2

        let sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        let itemSize = halfScreenWidth - sectionInset.left - sectionInset.right

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInset
        layout.itemSize = CGSize(width: itemSize, height: itemSize)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
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

extension ColorsItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let view = collectionView.dequeueReusableCell(withReuseIdentifier: cellID,
                                                            for: indexPath) as? ColorCollectionViewCell else {
                                                                return UICollectionViewCell()
        }
        view.color = colors[indexPath.row]
        return view
    }
}
