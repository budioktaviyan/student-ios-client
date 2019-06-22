import Alamofire
import RxAlamofire
import RxSwift

enum Key: String {
    case URL = "URL"
}

final class Network<T: Codable> {

    private static var info: [String: Any] {
        guard let result: [String: Any] = Bundle.main.infoDictionary else { fatalError("Info.plist not found!") }
        return result
    }

    private let baseURL: String
    private let scheduler: ConcurrentDispatchQueueScheduler

    init(_ baseURL: String = "\(configuration(.URL))/api/") {
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

    private static func configuration(_ key: Key) -> String {
        return info[key.rawValue] as! String
    }
}
