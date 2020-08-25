import XCTest
import SnapshotTesting

@testable import NatDS

class ExpansionPanelSnapshotTests: XCTestCase {
    var systemUnderTest: ExpansionPanel!
    var detailMock: UILabel!
    var otherDetailMock: UILabel!
    let builder = ExpansionPanelBuilder()

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

        detailMock = builder.detailMock
        otherDetailMock = builder.otherDetailMock

        systemUnderTest = ExpansionPanel(viewAnimating: builder.viewAnimatingMock, notificationCenter: NotificationCenterSpy())
        systemUnderTest.setSubtitle(builder.subtitleMock)
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false
        systemUnderTest.layoutIfNeeded()
    }

    func test_defaultInit_hasValidSnapshot() {
        systemUnderTest = ExpansionPanel()
        systemUnderTest.setSubtitle(builder.subtitleMock)
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false
        systemUnderTest.layoutIfNeeded()

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_initWithViewAnimating_hasValidSnapshot() {
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_defaultInit_withLongSubtitle_hasValidSnapshot() {
        systemUnderTest = ExpansionPanel()
        systemUnderTest.setSubtitle(builder.longSubtitleMock)
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false
        systemUnderTest.layoutIfNeeded()

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_initWithViewAnimating_withLongSubtitle_hasValidSnapshot() {
        systemUnderTest = ExpansionPanel(viewAnimating: builder.viewAnimatingMock, notificationCenter: NotificationCenterSpy())
        systemUnderTest.setSubtitle(builder.longSubtitleMock)
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false
        systemUnderTest.layoutIfNeeded()

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_defaultInit_withLongSubtitle_andLimitedSize_hasValidSnapshot() {
        systemUnderTest = ExpansionPanel()
        systemUnderTest.setSubtitle(builder.longSubtitleMock)
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false
        let view = addsSutOnViewLimitedSize()

        assertSnapshot(matching: view, as: .image)
    }

    func test_initWithViewAnimating_withLongSubtitle_andLimitedSize_hasValidSnapshot() {
        systemUnderTest = ExpansionPanel(viewAnimating: builder.viewAnimatingMock, notificationCenter: NotificationCenterSpy())
        systemUnderTest.setSubtitle(builder.longSubtitleMock)
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false
        let view = addsSutOnViewLimitedSize()

        assertSnapshot(matching: view, as: .image)
    }

    func test_tapButtonOnce_showsButtonPointingUp() {
        let view = addsSutOnViewLimitedSize()

        tapButton()

        assertSnapshot(matching: view, as: .image)
    }

    func test_tapButtonTwice_showsButtonPointingDown() {
        let view = addsSutOnViewLimitedSize()

        tapButton()
        tapButton()

        assertSnapshot(matching: view, as: .image)
    }

    func test_tapButtonThrice_showsButtonPointingUp() {
        let view = addsSutOnViewLimitedSize()

        tapButton()
        tapButton()
        tapButton()

        assertSnapshot(matching: view, as: .image)
    }

    func test_tapButtonOnce_withDetailView_showsButtonPointingUp_AndDetailView() {
        let view = addsSutOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)

        tapButton()

        assertSnapshot(matching: view, as: .image)
    }

    func test_tapPanelOnce_withDetailView_showsButtonPointingUp_AndDetailView() {
        let view = addsSutOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)

        tapPanel()

        assertSnapshot(matching: view, as: .image)
    }

    func test_setDetailView_whenPanelIsExpanded_showsButtonPointingUp_AndDetailView() {
        let view = addsSutOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)
        tapPanel()

        systemUnderTest.setDetailView(otherDetailMock)

        assertSnapshot(matching: view, as: .image)
    }

    func test_tapPanelToCollapse_whenSetDetailView_AndPanelIsExpanded_showsButtonPointingDown() {
        let view = addsSutOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)
        tapPanel()

        tapPanel()

        assertSnapshot(matching: view, as: .image)
    }

    func test_removeDetailView_AndPanelIsExpanded_showsButtonPointingDown() {
        let view = addsSutOnViewLargeHeight()
        systemUnderTest.setDetailView(detailMock)
        tapPanel()

        systemUnderTest.setDetailView(nil)

        assertSnapshot(matching: view, as: .image)
    }

    // MARK: Helper methods

    private func tapButton() {
        systemUnderTest.perform(Selector("didTapUpDownButton"))
    }

    private func tapPanel() {
        systemUnderTest.perform(Selector("didTapPanel"))
    }

    private func addsSutOnViewLimitedSize() -> UIView {
        let frame = CGRect(x: 0, y: 0, width: 320, height: 200)
        return addsSystemUnderTestOnView(frame: frame)
    }

    private func addsSutOnViewLargeHeight() -> UIView {
        let frame = CGRect(x: 0, y: 0, width: 320, height: 420)
        return addsSystemUnderTestOnView(frame: frame)
    }

    private func addsSystemUnderTestOnView(frame: CGRect) -> UIView {
        let view = UIView(frame: frame)
        view.addSubview(systemUnderTest)
        view.backgroundColor = .white
        setSystemUnderTestConstraints(with: view)
        return view
    }

    private func setSystemUnderTestConstraints(with view: UIView) {
        NSLayoutConstraint.activate([
            systemUnderTest.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            systemUnderTest.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            systemUnderTest.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
}
