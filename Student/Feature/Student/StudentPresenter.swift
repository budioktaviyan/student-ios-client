import RxSwift

class StudentPresenter {

    private let usecase: StudentUsecase

    private var view: StudentView?

    init(usecase: StudentUsecase) {
        self.usecase = usecase
    }

    deinit {
        usecase.dispose()
    }

    func attach(with view: StudentView) {
        self.view = view
    }

    func student() {
        view?.showLoading()
        usecase.execute(singleObserver: StudentUsecaseObserver(with: view!), params: nil)
    }
}

fileprivate class StudentUsecaseObserver: DefaultObserver<StudentEntity> {

    private let view: StudentView

    init(with view: StudentView) {
        self.view = view
    }

    override func onEvent(event: SingleEvent<StudentEntity>) {
        switch event {
        case .success(let entity):
            view.hideLoading()
            view.fetchSuccess(entity: entity)
        case .error(let error):
            print(error.localizedDescription)
            view.hideLoading()
            view.fetchFailed()
        }
    }
}
