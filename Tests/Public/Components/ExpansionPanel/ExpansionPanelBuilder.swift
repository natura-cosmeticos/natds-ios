import UIKit
@testable import NatDS

struct ExpansionPanelBuilder {

    let viewAnimatingMock = ViewAnimatingMock()

    let subtitleMock = "Subtitle"

    let longSubtitleMock = "Since he was lost in the dark without hope, and could neither go on nor back."

    var detailMock: UILabel {
        let label = defaultLabel
        // swiftlint:disable line_length
        label.text = "As for the Hobbits of the Shire, with whom these tales are concerned, in the days of their peace and prosperity they were a merry folk. They dressed in bright colors, being notably fond of yellow and green; but they seldom wore shoes, since their feet had tough leathery soles and were clad in a thick curling hair, much like the hair of their heads, which was commonly brown."
        // swiftlint:enable line_length
        return label
    }

    var otherDetailMock: UILabel {
        let label = defaultLabel
        // swiftlint:disable line_length
        label.text = "The habit of building farmhouses and barns was said to have begun among the inhabitants of the Marish down by the Brandywine."
        // swiftlint:enable line_length
        return label
    }

    private var defaultLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = NatColors.onSurface
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        return label
    }

}
