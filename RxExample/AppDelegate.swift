import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	let window = UIWindow(frame: UIScreen.main.bounds)

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let navigationController = UINavigationController(rootViewController: SelectionViewController())		
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
		return true
	}
}

