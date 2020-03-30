import NatDS

class ColorsItemViewController: UIViewController, SampleItem {
    static var name = "Colors"

    private let colorSections: [String] = [
        "Unknown",
        "Content",
        "Feedback"
    ]

    private let colors: [String: [DSColor]] = [
        "Unknown": [
            ("Primary", Colors.primary),
            ("Secondary", Colors.secondary),
            ("Surface Dark", Colors.surfaceDark),
            ("Surface Light", Colors.surfaceLight)
        ],
        "Content": [
            ("Highlight", Colors.Content.highlight),
            ("High Emphasis", Colors.Content.highEmphasis),
            ("Medium Emphasis", Colors.Content.mediumEmphasis),
            ("Low Emphasis", Colors.Content.lowEmphasis)
        ],
        "Feedback": [
            ("Alert", Colors.Feedback.alert),
            ("Success", Colors.Feedback.success)
        ]
    ]

    private lazy var collectionView: UICollectionView = {
        let halfScreenWidth = UIScreen.main.bounds.width / 2

        let sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        let itemSize = halfScreenWidth - sectionInset.left - sectionInset.right

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInset
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 30)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.register(ColorCollectionViewCell.self)

        collectionView.register(ColorHeaderCollectionViewCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "ColorHeaderCollectionViewCell")
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

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return colorSections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let colorGroup = colorSections[section]
        return colors[colorGroup]?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        let cell = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "ColorHeaderCollectionViewCell",
            for: indexPath
        )

        if kind == UICollectionView.elementKindSectionHeader,
            let view = cell as? ColorHeaderCollectionViewCell {
            view.name = colorSections[indexPath.section]
            return view
        }

        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(for: indexPath, cellType: ColorCollectionViewCell.self)

        let colorGroup = colorSections[indexPath.section]
        view.color = colors[colorGroup]?[indexPath.item]
        return view
    }
}
