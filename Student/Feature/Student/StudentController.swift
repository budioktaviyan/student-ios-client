import UIKit

class StudentController: UIViewController {

    private lazy var presenter = Injector.instance.resolve(type: StudentPresenter.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Student"

        presenter.attach(with: self)
        presenter.student()
    }
}

extension StudentController: StudentView {

    func showLoading() {}

    func hideLoading() {}

    func fetchSuccess(entity: StudentEntity) {
        let _ = entity.data.compactMap { data -> StudentData in
            print(data.id)
            print(data.name)
            print(data.email)

            return StudentData(id: data.id, name: data.name, email: data.name)
        }

        let alert = UIAlertController(
            title: "Student",
            message: "Total student:\(entity.data.count)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }

    func fetchFailed() {}
}
