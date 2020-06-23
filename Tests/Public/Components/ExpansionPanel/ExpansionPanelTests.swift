import XCTest
import FBSnapshotTestCase
@testable import NatDS

class ExpansionPanelTests: FBSnapshotTestCase {

    var sut: ExpansionPanel!
    var viewAnimatingMock: ViewAnimatingMock!
    let subtitle = "Subtitle"
    let longSubtitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt"

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.save(theme: NaturaTheme())

        viewAnimatingMock = ViewAnimatingMock()

        sut = ExpansionPanel(viewAnimating: viewAnimatingMock)
        sut.setSubtitle(subtitle)
        sut.layoutIfNeeded()
    }

    func test_defaultInit_hasValidSnapshot() {
        sut = ExpansionPanel()
        sut.setSubtitle(subtitle)
        sut.layoutIfNeeded()

        FBSnapshotVerifyView(sut)
    }

    func test_initWithViewAnimating_hasValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }

    func test_defaultInit_withLongSubtitle_hasValidSnapshot() {
        sut = ExpansionPanel()
        sut.setSubtitle(longSubtitle)
        sut.layoutIfNeeded()

        FBSnapshotVerifyView(sut)
    }

    func test_initWithViewAnimating_withLongSubtitle_hasValidSnapshot() {
        sut = ExpansionPanel(viewAnimating: viewAnimatingMock)
        sut.setSubtitle(longSubtitle)
        sut.layoutIfNeeded()

        FBSnapshotVerifyView(sut)
    }

    func test_defaultInit_withLongSubtitle_andLimitedSize_hasValidSnapshot() {
        sut = ExpansionPanel()
        sut.setSubtitle(longSubtitle)
        let view = addsOnViewLimitedSize()

        FBSnapshotVerifyView(view)
    }

    func test_initWithViewAnimating_withLongSubtitle_andLimitedSize_hasValidSnapshot() {
        sut = ExpansionPanel(viewAnimating: viewAnimatingMock)
        sut.setSubtitle(longSubtitle)
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

    // MARK: Helper methods

    private func tapButton() {
        sut.perform(Selector("didTapUpDownButton"))
    }

    private func addsOnViewLimitedSize() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 80))
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
