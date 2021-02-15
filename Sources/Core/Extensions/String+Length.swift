extension String {
    func maxCharCount(_ length: Int) -> String {
        var str = self
        let nsString = str as NSString
        if nsString.length >= length {
            str = nsString.substring(with: NSRange(location: 0,
                                                   length: nsString.length > length ? length : nsString.length))
        }
        return  str
    }
}
