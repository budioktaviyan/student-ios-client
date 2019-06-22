import RxSwift

protocol StudentRepositoryDelegate {

    func student() -> Single<StudentEntity>
}

class StudentRepository: StudentRepositoryDelegate {

    private let factory: StudentFactory

    init(factory: StudentFactory) {
        self.factory = factory
    }

    func student() -> Single<StudentEntity> {
        return factory.student().map { value -> StudentEntity in
            let student = value.data?.compactMap { data -> Student in
                let id = data.id ?? 0
                let name = data.name ?? ""
                let email = data.email ?? ""

                return Student(id: id, name: name, email: email)
            }

            return StudentEntity(student: student ?? [])
        }
    }
}
