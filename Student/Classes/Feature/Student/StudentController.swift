import UIKit

class StudentController: DatasourceController {

    var presenter: StudentPresenter!

    private lazy var datasources: StudentViewDatasource = StudentViewDatasource()
    private lazy var loadingView: LoadingView = LoadingView()
    private lazy var errorView: ErrorView = {
        let view = ErrorView()
        view.delegate = self

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Student"
        self.collectionView?.backgroundColor = .white
        self.datasource = datasources

        presenter.student()
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 75)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    private func reloadData() {
        collectionView?.reloadData()
    }
}

extension StudentController: ErrorDelegate {

    func onRetryClicked() {
        errorView.isHidden = true
        errorView.removeFromSuperview()
        presenter.student()
    }

    private func initLoadingView() {
        view.addSubview(loadingView)
        loadingView.anchor(
            view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            topConstant: 0,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: 0,
            heightConstant: 0
        )
    }

    private func initErrorView() {
        view.addSubview(errorView)
        errorView.anchor(
            view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            topConstant: 0,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: 0,
            heightConstant: 0
        )
    }
}

extension StudentController: StudentView {

    func showLoading() {
        initLoadingView()
        loadingView.show()
    }

    func hideLoading() {
        reloadData()
        loadingView.hide()
    }

    func fetchSuccess(entity: StudentEntity) {
        datasources.objects = entity.student
    }

    func fetchFailed(message: String) {
        initErrorView()
        errorView.isHidden = false
        print(message)
    }
}
