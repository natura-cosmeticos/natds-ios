import FBSnapshotTestCase

@testable import NatDS

class NatDialogControllerSnapshotTests: FBSnapshotTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 380, height: 600))
        superview.backgroundColor = .white
        DesignSystem().configure(with: .natura)

    }

    func test_dialog_minimum_constraints_for_size_hasValidSnapshot() {
        let systemUnderTest = NatDialogController(views: [])

        superview.addSubview(systemUnderTest.view)

        FBSnapshotVerifyView(superview)
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

        FBSnapshotVerifyView(superview)
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

        FBSnapshotVerifyView(superview)
    }
}
