import Alamofire
import RxAlamofire
import RxSwift

final class Network<T: Codable> {

    private let baseURL: String
    private let scheduler: ConcurrentDispatchQueueScheduler

    init(_ baseURL: String = "http://df2f7e1b.ngrok.io") {
        self.baseURL = baseURL
        self.scheduler = ConcurrentDispatchQueueScheduler(
            qos: DispatchQoS(
                qosClass: DispatchQoS.QoSClass.background,
                relativePriority: 1
            )
        )
    }

    func student(_ path: String) -> Single<T> {
        let absolutePath: String = "\(baseURL)/\(path)"
        return RxAlamofire
            .data(
                .get,
                absolutePath,
                encoding: URLEncoding()
            )
            .debug()
            .asSingle()
            .observeOn(scheduler)
            .map(T.self)
    }
}
