protocol StudentView {

    func showLoading()
    func hideLoading()
    func fetchSuccess(entity: StudentEntity)
    func fetchFailed()
}
