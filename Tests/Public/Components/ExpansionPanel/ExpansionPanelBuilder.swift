import UIKit

struct ExpansionPanelBuilder {

    let viewAnimatingMock = ViewAnimatingMock()

    let subtitleMock = "Subtitle"

    let longSubtitleMock = "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt"

    var detailMock: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        // swiftlint:disable line_length
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        // swiftlint:enable line_length
        return label
    }

    var otherDetailMock: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        // swiftlint:disable line_length
        label.text = "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        // swiftlint:enable line_length
        return label
    }

}
