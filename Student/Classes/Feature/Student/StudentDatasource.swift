import RxSwift

protocol StudentDatasourceDelegate {

    associatedtype T: Codable

    func student() -> Single<T>
}

class StudentDatasource: StudentDatasourceDelegate {

    typealias T = StudentResponse

    var network: Network<T>!

    func student() -> PrimitiveSequence<SingleTrait, StudentResponse> {
        return network.student("api/v1/student")
    }
}
