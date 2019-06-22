import RxSwift

class StudentFactory {

    private let datasource: StudentDatasource

    init(datasource: StudentDatasource) {
        self.datasource = datasource
    }

    func student() -> Single<StudentResponse> {
        return datasource.student()
    }
}
