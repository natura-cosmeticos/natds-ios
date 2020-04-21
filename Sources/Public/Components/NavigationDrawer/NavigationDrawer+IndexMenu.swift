public extension NavigationDrawer {
    class IndexMenu: NSObject {
        public let item: Int
        public let subitem: Int

        public init(item: Int, subitem: Int) {
            self.item = item
            self.subitem = subitem
        }
    }
}
