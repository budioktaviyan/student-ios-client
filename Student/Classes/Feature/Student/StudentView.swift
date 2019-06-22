protocol StudentView: class {

    func showLoading()
    func hideLoading()
    func fetchSuccess(entity: StudentEntity)
    func fetchFailed(message: String)
}
