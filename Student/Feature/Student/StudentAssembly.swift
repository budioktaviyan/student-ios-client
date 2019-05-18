import Swinject

class StudentAssembly: Assembly {

    func assemble(container: Container) {
        container.register(StudentDatasource.self) { _ in
            return StudentDatasource()
        }

        container.register(StudentFactory.self) { r in
            let datasource = r.resolve(StudentDatasource.self)!
            return StudentFactory(datasource: datasource)
        }

        container.register(StudentRepository.self) { r in
            let factory = r.resolve(StudentFactory.self)!
            return StudentRepository(factory: factory)
        }

        container.register(StudentUsecase.self) { r in
            let repository = r.resolve(StudentRepository.self)!
            let executor = r.resolve(JobExecutor.self)!
            let thread = r.resolve(UIThread.self)!

            return StudentUsecase(
                repository: repository,
                executor: executor,
                thread: thread
            )
        }

        container.register(StudentPresenter.self) { r in
            let usecase = r.resolve(StudentUsecase.self)!
            return StudentPresenter(usecase: usecase)
        }
    }
}
