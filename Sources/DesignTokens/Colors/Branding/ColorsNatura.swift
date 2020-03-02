struct ColorsNatura {
    enum Primary {
        static let orange: UIColor = UIColor.hexColorOrDefault("#FF6B0B")
        static let yellow: UIColor = UIColor.hexColorOrDefault("#F4AB34")
    }

    enum PB {
        static let gray: UIColor = UIColor.hexColorOrDefault("#333333")
        static let gray2: UIColor = UIColor.hexColorOrDefault("#BBBBBB")
        static let gray3: UIColor = UIColor.hexColorOrDefault("#EEEEEE")
        static let black: UIColor = UIColor.hexColorOrDefault("#000000")
    }

    enum Content {
        static let highlight = UIColor.hexColorOrDefault("#000000")
        static let highEmphasis = UIColor.hexColorOrDefault("#333333")
        static let mediumEmphasis = UIColor.hexColorOrDefault("#777777")
        static let lowEmphasis = UIColor.hexColorOrDefault("#BBBBBB")
    }

    enum Feedback {
        static let alert = UIColor.hexColorOrDefault("#E74627")
    }

}
