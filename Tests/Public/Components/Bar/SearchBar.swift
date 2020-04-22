import FBSnapshotTestCase
@testable import NatDS

class SearchBarTests: FBSnapshotTestCase {

    var superview: UIView!
    var sut: SearchBar!

    override func setUp() {
        super.setUp()

        sut = SearchBar()
        sut.backgroundColor = .white
        sut.placeholder = "Type some text"

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 112))
        superview.backgroundColor = .white
        superview.addSubview(sut)

        sut.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            sut.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            sut.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            sut.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            sut.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func test_state_whenHasNoFocus_expectPlaceholderMessageWithoutCleanButton() {
        FBSnapshotVerifyView(superview)
    }

    func test_state_whenHasText_expectedCleanButtonIsVisible() {
        sut.text = "NAT NATURA"
        FBSnapshotVerifyView(superview)
    }
}
