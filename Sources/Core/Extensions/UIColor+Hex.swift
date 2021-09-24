// swiftlint:disable identifier_name
extension UIColor {
    convenience init?(hex: String) {

        var hexString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        if hexString.count == 3 {
            var fullString = ""
            for char in hexString {
                fullString.append(char)
                fullString.append(char)
            }
            hexString = fullString
        }

        if hexString.count == 6 {
            hexString.append("FF")
        }

        if hexString.count != 8 {
            return nil
        }

        let scanner = Scanner(string: hexString)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let mask = 0x00000000FF
        let r = Int(color >> 24) & mask
        let g = Int(color >> 16) & mask
        let b = Int(color >> 8) & mask
        let a = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        let alpha = CGFloat(a) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    static func hexColorOrDefault(_ hex: String) -> UIColor {
        return UIColor(hex: hex) ?? .black
    }
}
