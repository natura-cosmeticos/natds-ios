import XCTest
import FBSnapshotTestCase
@testable import NatDS

class ExpansionPanelTests: FBSnapshotTestCase {

    var systemUnderTest: ExpansionPanel!
    var detailMock: UILabel!
    var otherDetailMock: UILabel!
    let builder = ExpansionPanelBuilder()

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.save(theme: NaturaTheme())

        detailMock = builder.detailMock
        otherDetailMock = builder.otherDetailMock

        systemUnderTest = builder.panelWithViewAnimating
        systemUnderTest.layoutIfNeeded()
    }

    func test_defaultInit_hasValidSnapshot() {
        systemUnderTest = builder.panelDefault
        systemUnderTest.layoutIfNeeded()

        FBSnapshotVerifyView(systemUnderTest)
    }

    func test_initWithViewAnimating_hasValidSnapshot() {
        FBSnapshotVerifyView(systemUnderTest)
    }

    func test_defaultInit_withLongSubtitle_hasValidSnapshot() {
        systemUnderTest = builder.panelDefaultWithLongSubtitle
        systemUnderTest.layoutIfNeeded()

        FBSnapshotVerifyView(systemUnderTest)
    }

    func test_initWithViewAnimating_withLongSubtitle_hasValidSnapshot() {
        systemUnderTest = builder.panelWithViewAnimatingAndLongSubtitle
        systemUnderTest.layoutIfNeeded()

        FBSnapshotVerifyView(systemUnderTest)
    }

    func test_defaultInit_withLongSubtitle_andLimitedSize_hasValidSnapshot() {
        systemUnderTest = builder.panelDefaultWithLongSubtitle
        let view = addsOnViewLimitedSize()

        FBSnapshotVerifyView(view)
    }

    func test_initWithViewAnimating_withLongSubtitle_andLimitedSize_hasValidSnapshot() {
        systemUnderTest = builder.panelWithViewAnimatingAndLongSubtitle
        let view = addsOnViewLimitedSize()

        FBSnapshotVerifyView(view)
    }

    func test_tapButtonOnce_showsButtonPointingUp() {
        let view = addsOnViewLimitedSize()

        tapButton()

        FBSnapshotVerifyView(view)
    }

    func test_tapButtonTwice_showsButtonPointingDown() {
        let view = addsOnViewLimitedSize()

        tapButton()
        tapButton()

        FBSnapshotVerifyView(view)
    }

    func test_tapButtonThrice_showsButtonPointingUp() {
        let view = addsOnViewLimitedSize()

        tapButton()
        tapButton()
        tapButton()

        FBSnapshotVerifyView(view)
    }

    func test_tapButtonOnce_withDetailView_showsButtonPointingUp_AndDetailView() {
        let view = addsOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)

        tapButton()

        FBSnapshotVerifyView(view)
    }

    func test_tapPanelOnce_withDetailView_showsButtonPointingUp_AndDetailView() {
        let view = addsOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)

        tapPanel()

        FBSnapshotVerifyView(view)
    }

    func test_setDetailView_whenPanelIsExpanded_showsButtonPointingUp_AndDetailView() {
        let view = addsOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)
        tapPanel()

        systemUnderTest.setDetailView(otherDetailMock)

        FBSnapshotVerifyView(view)
    }

    func test_tapPanelToCollapse_whenSetDetailView_AndPanelIsExpanded_showsButtonPointingDown() {
        let view = addsOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)
        tapPanel()

        tapPanel()

        FBSnapshotVerifyView(view)
    }

    func test_removeDetailView_AndPanelIsExpanded_showsButtonPointingDown() {
        let view = addsOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)
        tapPanel()

        systemUnderTest.setDetailView(nil)

        FBSnapshotVerifyView(view)
    }

    // MARK: Helper methods

    private func tapButton() {
        systemUnderTest.perform(Selector("didTapUpDownButton"))
    }

    private func tapPanel() {
        systemUnderTest.perform(Selector("didTapPanel"))
    }

    private func addsOnViewLimitedSize() -> UIView {
        return addsOnView(frame: CGRect(x: 0, y: 0, width: 320, height: 200))
    }

    private func addsOnViewLargeHeight() -> UIView {
        return addsOnView(frame: CGRect(x: 0, y: 0, width: 320, height: 420))
    }

    private func addsOnView(frame: CGRect) -> UIView {
        let view = UIView(frame: frame)
        view.addSubview(systemUnderTest)
        view.backgroundColor = .white
        setConstraints(with: view)
        return view
    }

    private func setConstraints(with view: UIView) {
        NSLayoutConstraint.activate([
            systemUnderTest.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            systemUnderTest.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            systemUnderTest.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }

}
