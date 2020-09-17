import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        ThemeManager.shared.setLight()

        let window = UIWindow()
        window.rootViewController = CustomSplashViewController()
        window.makeKeyAndVisible()

        self.window = window

        return true
    }
}
