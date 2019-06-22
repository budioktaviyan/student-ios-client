import UIKit
import Swinject

protocol RouterDelegate {

    var resolver: Resolver { get }

    func presentModule(module: Module)
    func presentView(controller: UIViewController)
}

class Router: RouterDelegate {

    static let instance: Router = Router.create()

    private let assembler: Assembler
    private let navigation: UINavigationController

    init(assembler: Assembler,
         navigation: UINavigationController) {
        self.assembler = assembler
        self.navigation = navigation
    }

    var resolver: Resolver { return assembler.resolver }

    func presentModule(module: Module) {
        module.presentView()
    }

    func presentView(controller: UIViewController) {
        navigation.pushViewController(controller, animated: true)
    }

    private static func create() -> Router {
        let assembler: Assembler = Assembler()
        assembler.apply(
            assemblies: [
                ApplicationAssembly(),
                StudentAssembly()
            ]
        )

        let root: UINavigationController = UIApplication.shared.delegate!.window!!.rootViewController as! UINavigationController
        let router: Router = Router(assembler: assembler, navigation: root)

        return router
    }
}
