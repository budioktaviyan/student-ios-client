import UIKit

class StudentController: UIViewController {

    var presenter: StudentPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Student"
        self.view.backgroundColor = .white

        presenter.student()
    }
}

extension StudentController: StudentView {

    func showLoading() {}

    func hideLoading() {}

    func fetchSuccess(entity: StudentEntity) {
        let _ = entity.data.compactMap { data -> Student in
            print(data.id)
            print(data.name)
            print(data.email)

            return Student(id: data.id, name: data.name, email: data.name)
        }

        let alert = UIAlertController(
            title: "Student",
            message: "Total student:\(entity.data.count)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }

    func fetchFailed(message: String) {
        print(message)
    }
}
