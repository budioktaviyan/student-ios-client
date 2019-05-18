import RxSwift

protocol StudentDatasourceDelegate {

    associatedtype T: Codable

    func student() -> Single<T>
}

class StudentDatasource: StudentDatasourceDelegate {

    typealias T = StudentResponse

    private lazy var network = Injector.instance.resolve(type: Network<T>.self)

    func student() -> PrimitiveSequence<SingleTrait, StudentResponse> {
        return network.student("api/v1/student")
    }
}
