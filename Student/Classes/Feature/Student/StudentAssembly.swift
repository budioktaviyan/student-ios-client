import Swinject

class StudentAssembly: Assembly {

    func assemble(container: Container) {
        container.register(Network.self) { _ in
            return Network<StudentResponse>()
        }

        container.register(StudentDatasource.self) {(r, router: Router) in
            let datasource: StudentDatasource = StudentDatasource()
            let network: Network<StudentResponse> = r.resolve(Network.self)!
            datasource.network = network

            return datasource
        }

        container.register(StudentFactory.self) {(r, router: Router) in
            let datasource: StudentDatasource = r.resolve(StudentDatasource.self, argument: router)!
            return StudentFactory(datasource: datasource)
        }

        container.register(StudentRepository.self) {(r, router: Router) in
            let factory: StudentFactory = r.resolve(StudentFactory.self, argument: router)!
            return StudentRepository(factory: factory)
        }

        container.register(StudentUsecase.self) {(r, router: Router) in
            let repository: StudentRepository = r.resolve(StudentRepository.self, argument: router)!
            let executor: JobExecutor = r.resolve(JobExecutor.self)!
            let thread: UIThread = r.resolve(UIThread.self)!

            return StudentUsecase(
                repository: repository,
                executor: executor,
                thread: thread
            )
        }

        container.register(StudentPresenter.self) {(r, router: Router, view: StudentView) in
            let usecase: StudentUsecase = r.resolve(StudentUsecase.self, argument: router)!
            return StudentPresenter(
                view: view,
                usecase: usecase
            )
        }

        container.register(StudentController.self) {(r, router: Router) in
            let view: StudentController = StudentController()
            let presenter: StudentPresenter = r.resolve(StudentPresenter.self, arguments: router, view as StudentView)!
            view.presenter = presenter

            return view
        }
    }
}
