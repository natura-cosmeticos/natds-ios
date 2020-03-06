extension String {
    func range(for text: String) -> NSRange {
        return (self as NSString).range(of: text)
    }
}
