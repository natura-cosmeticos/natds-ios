import XCTest

class UICollectionViewReusableTests: XCTestCase {

    func test_dequeueReusableCell_whenItRegistersValidIdentifier_returnsNonNullCell() {
        let sut = UICollectionView(frame: .zero, collectionViewLayout: .init())
        sut.dataSource = self
        sut.register(UICollectionViewCell.self)

        let cell = sut.dequeueReusableCell(for: IndexPath(row: 0, section: 0))

        XCTAssertNotNil(cell)
    }

}

extension UICollectionViewReusableTests: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
