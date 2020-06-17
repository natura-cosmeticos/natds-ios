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

    func test_natDialog_style_standard_hasValidSnapshot() {
        let systemUnderTest = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: "Some body text to make a snapshot text without think about the future.")
            .configure(primaryTitle: "Primary", primaryAction: {})
            .configure(secondaryTitle: "Secondary", secondaryAction: {})
            .build()
        
        superview.addSubview(systemUnderTest.view)

        FBSnapshotVerifyView(superview)
    }
}
