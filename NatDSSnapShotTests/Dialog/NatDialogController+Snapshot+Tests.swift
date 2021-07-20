import XCTest
import SnapshotTesting

@testable import NatDS

final class NatDialogControllerSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        superview = .init(frame: .init(x: 0, y: 0, width: 375, height: 600))
        superview.backgroundColor = .white
    }

    func test_dialog_minimum_constraints_for_size_hasValidSnapshot() {
        let systemUnderTest = NatDialogController(viewModel: .init())

        superview.addSubview(systemUnderTest.view)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_dialog_style_standard_hasValidSnapshot() {
        let systemUnderTest = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Primary", withAction: {})
            .configure(secondaryButtonTitle: "Secondary", withAction: {})
            .build()

        superview.addSubview(systemUnderTest.view)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_dialog_style_standard_without_title_hasValidSnapshot() {
        let systemUnderTest = NatDialogController
            .standardStyleBuilder
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Primary", withAction: {})
            .configure(secondaryButtonTitle: "Secondary", withAction: {})
            .build()

        superview.addSubview(systemUnderTest.view)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_dialog_style_standard_with_vertical_buttons_hasValidSnapshot() {
        let systemUnderTest = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Primary big big title", withAction: {})
            .configure(secondaryButtonTitle: "Secondary", withAction: {})
            .build()

        superview.addSubview(systemUnderTest.view)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_dialog_style_standard_with_title_hasValidSnapshot() {
        let systemUnderTest = NatDialogController
            .alertStyleBuilder
            .configure(title: "Title")
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Primary", withAction: {})
            .configure(secondaryButtonTitle: "Secondary", withAction: {})
            .build()

        superview.addSubview(systemUnderTest.view)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_dialog_style_standard_with_divider_hasValidSnapshot() {
        let systemUnderTest = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(divider: true)
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Primary", withAction: {})
            .configure(secondaryButtonTitle: "Secondary", withAction: {})
            .build()

        superview.addSubview(systemUnderTest.view)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_dialog_style_alert_hasValidSnapshot() {
        let systemUnderTest = NatDialogController
            .alertStyleBuilder
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Primary", withAction: {})
            .configure(secondaryButtonTitle: "Secondary", withAction: {})
            .build()

        superview.addSubview(systemUnderTest.view)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_dialog_style_alert_with_vertical_buttons_hasValidSnapshot() {
        let systemUnderTest = NatDialogController
            .alertStyleBuilder
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryButtonTitle: "Primary big big title", withAction: {})
            .configure(secondaryButtonTitle: "Secondary", withAction: {})
            .build()

        superview.addSubview(systemUnderTest.view)

        assertSnapshot(matching: superview, as: .image)
    }
}
