import XCTest
import SnapshotTesting

@testable import NatDS


class NatAlertSnapshotTests: XCTestCase {
    var superview: UIView!
    
    override func setUp() {
        super.setUp()
        
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 330))
        superview.backgroundColor = .white
        
        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }
    
    func test_Nat_Alert_default_style() {
        let systemUnderTest = NatAlert()
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_warning_style() {
        let systemUnderTest = NatAlert(style: .warning)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_warning_with_primary_button() {
        let systemUnderTest = NatAlert(style: .warning)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        systemUnderTest.configure(primaryButtonTitle: "button 1")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_warning_with_primary_and_secondary_button() {
        let systemUnderTest = NatAlert(style: .warning)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        systemUnderTest.configure(primaryButtonTitle: "button 1")
        systemUnderTest.configure(secondaryButtonTitle: "button 2")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_warning_with_no_icon() {
        let systemUnderTest = NatAlert(style: .warning)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        systemUnderTest.configure(showIcon: false)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_warning_with_no_title() {
        let systemUnderTest = NatAlert(style: .warning)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        systemUnderTest.showTitle = false
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_warning_with_no_icon_and_no_title() {
        let systemUnderTest = NatAlert(style: .warning)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        systemUnderTest.showTitle = false
        systemUnderTest.configure(showIcon: false)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_warning_outlined() {
        let systemUnderTest = NatAlert(style: .warning, type: .outlined)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_success_outlined() {
        let systemUnderTest = NatAlert(style: .success, type: .outlined)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_error_outlined() {
        let systemUnderTest = NatAlert(style: .error, type: .outlined)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_default_outlined() {
        let systemUnderTest = NatAlert(type: .outlined)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
 
    
    func test_Nat_Alert_success_default() {
        let systemUnderTest = NatAlert(style: .success)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_error_default() {
        let systemUnderTest = NatAlert(style: .error)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    func test_Nat_Alert_info_default() {
        let systemUnderTest = NatAlert(style: .info)
        
        systemUnderTest.configure(titleText: "This is a title")
        systemUnderTest.configure(descriptionText: "This is a description")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)
        
        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
    
    private func addConstraints(_ systemUnderTest: UIView) {
        
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    

}

