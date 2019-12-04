public extension NavigationDrawer {
    class IndexMenu: NSObject {
        let item: Int
        let subitem: Int

        init(_ indexPath: IndexPath) {
            self.item = indexPath.section
            self.subitem = indexPath.row
        }
    }
}
