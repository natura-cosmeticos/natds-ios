struct ColorsNatura {
    enum Primary {
        static let orange: UIColor = UIColor.hexColorOrDefault("#FF6B0B")
        static let yellow: UIColor = UIColor.hexColorOrDefault("#F4AB34")
    }

    enum PB {
        static let gray3: UIColor = UIColor.hexColorOrDefault("#EEEEEE")

        /// DEPRECATED: Will be removed in version 0.0.18
        @available(*, deprecated, message: "PB.gray is deprecated instead use ColorsNatura.Content.highEmphasis")
        static let gray: UIColor = UIColor.hexColorOrDefault("#333333")
        /// DEPRECATED: Will be removed in version 0.0.18
        @available(*, deprecated, message: "PB.gray2 is deprecated instead use ColorsNatura.Content.lowEmphasis")
        static let gray2: UIColor = UIColor.hexColorOrDefault("#BBBBBB")
        /// DEPRECATED: Will be removed in version 0.0.18
        @available(*, deprecated, message: "PB.black is deprecated instead use ColorsNatura.Content.highlight")
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
