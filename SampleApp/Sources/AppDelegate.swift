import UIKit
import NatDS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        DesignSystem().configure(with: .naturaLight)

        let window = UIWindow()
        window.rootViewController = CustomSplashViewController()
        window.makeKeyAndVisible()

        self.window = window

        return true
    }
}
