struct ColorsNatura {
    enum Primary {
        static let orange: UIColor = UIColor.hexColorOrDefault("#FF6B0B")
        static let yellow: UIColor = UIColor.hexColorOrDefault("#F4AB34")
    }

    enum Content {
        static let highlight = UIColor.hexColorOrDefault("#000000")
        static let highEmphasis = UIColor.hexColorOrDefault("#333333")
        static let mediumEmphasis = UIColor.hexColorOrDefault("#777777")
        static let lowEmphasis = UIColor.hexColorOrDefault("#BBBBBB")
    }

    enum Surface {
        static let light = UIColor.hexColorOrDefault("#FFFFFF")
        static let dark = UIColor.hexColorOrDefault("#333333")
        static let background = UIColor.hexColorOrDefault("#FAFAFA")
        static let backgroundOn = UIColor.hexColorOrDefault("#EEEEEE")
    }

    enum Feedback {
        static let alert = UIColor.hexColorOrDefault("#E74627")
        static let success = UIColor.hexColorOrDefault("#569A32")
    }
}
