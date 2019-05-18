import UIKit

protocol RouterDelegate {

    func presentView(controller: UIViewController)
}

class Router: RouterDelegate {

    static let instance = Router.create()

    private let navigation: UINavigationController

    init(navigation: UINavigationController) {
        self.navigation = navigation
    }

    func presentView(controller: UIViewController) {
        navigation.pushViewController(controller, animated: true)
    }

    private static func create() -> Router {
        let root = UIApplication.shared.delegate!.window!!.rootViewController as! UINavigationController
        return Router(navigation: root)
    }
}
