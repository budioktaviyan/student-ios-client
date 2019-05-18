import Alamofire
import RxAlamofire
import RxSwift

final class Network<T: Codable> {

    private let baseURL: String
    private let scheduler: ConcurrentDispatchQueueScheduler

    init(_ baseURL: String) {
        self.baseURL = baseURL
        self.scheduler = ConcurrentDispatchQueueScheduler(
            qos: DispatchQoS(
                qosClass: DispatchQoS.QoSClass.background,
                relativePriority: 1
            )
        )
    }
}
