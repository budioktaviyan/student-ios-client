import RxSwift

class StudentPresenter {

    weak var view: StudentView!

    private let usecase: StudentUsecase

    init(view: StudentView,
         usecase: StudentUsecase) {
        self.view = view
        self.usecase = usecase
    }

    deinit {
        usecase.dispose()
    }

    func student() {
        view.showLoading()
        usecase.execute(singleObserver: StudentUsecaseObserver(with: view), params: nil)
    }
}

fileprivate class StudentUsecaseObserver: DefaultObserver<StudentEntity> {

    private weak var view: StudentView!

    init(with view: StudentView) {
        self.view = view
    }

    override func onEvent(event: SingleEvent<StudentEntity>) {
        switch event {
        case .success(let entity):
            view.hideLoading()
            view.fetchSuccess(entity: entity)
        case .error(let error):
            view.hideLoading()
            view.fetchFailed(message: error.localizedDescription)
        }
    }
}
