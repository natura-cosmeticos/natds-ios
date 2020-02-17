extension UICollectionView {

    public func register<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath,
                                                             cellType: T.Type = T.self) -> T {
        let dequeueCell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier,
                                                   for: indexPath)
        guard let cell = dequeueCell as? T else {
            fatalError("Could not dequeue cell with identifier: \(cellType.reuseIdentifier)")
        }
        return cell
    }

}
