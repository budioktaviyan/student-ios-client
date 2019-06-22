import RxSwift

class StudentUsecase: Usecase {

    private let repository: StudentRepository
    private let executor: JobExecutor
    private let thread: UIThread

    init(repository: StudentRepository,
         executor: JobExecutor,
         thread: UIThread) {
        self.repository = repository
        self.executor = executor
        self.thread = thread
    }

    var jobExecutor: JobExecutor { return executor }
    var uiThread: UIThread { return thread }
    var disposables: CompositeDisposable { return CompositeDisposable() }
}

extension StudentUsecase {

    func buildUsecaseObservable(params: Any?) -> Single<StudentEntity> {
        return repository.student()
    }
}
