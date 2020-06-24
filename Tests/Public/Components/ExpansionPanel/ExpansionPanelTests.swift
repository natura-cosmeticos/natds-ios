import XCTest
import FBSnapshotTestCase
@testable import NatDS

class ExpansionPanelTests: FBSnapshotTestCase {

    var sut: ExpansionPanel!
    var detailMock: UILabel!
    var otherDetailMock: UILabel!
    let builder = ExpansionPanelBuilder()

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.save(theme: NaturaTheme())

        detailMock = builder.detailMock
        otherDetailMock = builder.otherDetailMock

        sut = builder.panelWithViewAnimatingMock
        sut.layoutIfNeeded()
    }

    func test_defaultInit_hasValidSnapshot() {
        sut = builder.panelDefault
        sut.layoutIfNeeded()

        FBSnapshotVerifyView(sut)
    }

    func test_initWithViewAnimating_hasValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }

    func test_defaultInit_withLongSubtitle_hasValidSnapshot() {
        sut = builder.panelDefaultWithLongSubtitle
        sut.layoutIfNeeded()

        FBSnapshotVerifyView(sut)
    }

    func test_initWithViewAnimating_withLongSubtitle_hasValidSnapshot() {
        sut = builder.panelWithViewAnimatingMockAndLongSubtitle
        sut.layoutIfNeeded()

        FBSnapshotVerifyView(sut)
    }

    func test_defaultInit_withLongSubtitle_andLimitedSize_hasValidSnapshot() {
        sut = builder.panelDefaultWithLongSubtitle
        let view = addsOnViewLimitedSize()

        FBSnapshotVerifyView(view)
    }

    func test_initWithViewAnimating_withLongSubtitle_andLimitedSize_hasValidSnapshot() {
        sut = builder.panelWithViewAnimatingMockAndLongSubtitle
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
        sut.setDetailView(detailMock)

        tapButton()

        FBSnapshotVerifyView(view)
    }

    func test_tapPanelOnce_withDetailView_showsButtonPointingUp_AndDetailView() {
        let view = addsOnViewLargeHeight()
        sut.setDetailView(detailMock)

        tapPanel()

        FBSnapshotVerifyView(view)
    }

    func test_setDetailView_whenPanelIsExpanded_showsButtonPointingUp_AndDetailView() {
        let view = addsOnViewLargeHeight()
        sut.setDetailView(detailMock)
        tapPanel()

        sut.setDetailView(otherDetailMock)

        FBSnapshotVerifyView(view)
    }

    func test_tapPanelToCollapse_whenSetDetailView_AndPanelIsExpanded_showsButtonPointingDown() {
        let view = addsOnViewLargeHeight()
        sut.setDetailView(detailMock)
        tapPanel()

        tapPanel()

        FBSnapshotVerifyView(view)
    }

    func test_removeDetailView_AndPanelIsExpanded_showsButtonPointingDown() {
        let view = addsOnViewLargeHeight()
        sut.setDetailView(detailMock)
        tapPanel()

        sut.setDetailView(nil)

        FBSnapshotVerifyView(view)
    }

    // MARK: Helper methods

    private func tapButton() {
        sut.perform(Selector("didTapUpDownButton"))
    }

    private func tapPanel() {
        sut.perform(Selector("didTapPanel"))
    }

    private func addsOnViewLimitedSize() -> UIView {
        return addsOnView(frame: CGRect(x: 0, y: 0, width: 320, height: 200))
    }

    private func addsOnViewLargeHeight() -> UIView {
        return addsOnView(frame: CGRect(x: 0, y: 0, width: 320, height: 420))
    }

    private func addsOnView(frame: CGRect) -> UIView {
        let view = UIView(frame: frame)
        view.addSubview(sut)
        view.backgroundColor = .white
        setConstraints(with: view)
        return view
    }

    private func setConstraints(with view: UIView) {
        NSLayoutConstraint.activate([
            sut.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sut.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            sut.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }

}
