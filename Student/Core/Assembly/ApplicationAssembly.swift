import Swinject

class ApplicationAssembly: Assembly {

    func assemble(container: Container) {
        container.register(JobExecutor.self) { _ in
            return JobExecutor()
        }

        container.register(UIThread.self) { _ in
            return UIThread()
        }
    }
}
