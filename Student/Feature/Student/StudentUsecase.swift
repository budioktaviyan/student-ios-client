import RxSwift

class StudentUsecase: Usecase<StudentEntity, Any> {

    private let repository: StudentRepository

    init(repository: StudentRepository,
         executor: JobExecutor,
         thread: UIThread) {
        self.repository = repository
        super.init(jobExecutor: executor, uiThread: thread)
    }

    override func buildUsecaseObservable(params: Any?) -> PrimitiveSequence<SingleTrait, StudentEntity> {
        return repository.student()
    }
}
