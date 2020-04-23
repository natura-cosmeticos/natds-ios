extension UITableView {

    public func register<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath,
                                                        cellType: T.Type = T.self) -> T {
        let dequeueCell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier,
                                                   for: indexPath)
        guard let cell = dequeueCell as? T else {
            fatalError("Could not dequeue cell with identifier: \(cellType.reuseIdentifier)")
        }
        return cell
    }

}
