class StudentModule: Module {

    let router: Router

    init(router: Router) {
        self.router = router
    }

    func presentView() {
        let controller: StudentController = router.resolver.resolve(StudentController.self, argument: router)!
        router.presentView(controller: controller)
    }
}
