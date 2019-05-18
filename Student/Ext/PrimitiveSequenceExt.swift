import Foundation
import RxSwift

extension PrimitiveSequenceType where TraitType == SingleTrait, ElementType == Data {
    func map<T>(_ type: T.Type, using decoder: JSONDecoder? = nil) -> PrimitiveSequence<TraitType, T> where T: Decodable {
        return self.map { data -> T in
            let decoder: JSONDecoder = decoder ?? JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            return try decoder.decode(type, from: data)
        }
    }
}

extension PrimitiveSequenceType where TraitType == SingleTrait, ElementType == String {
    func map<T>(_ type: T.Type, using decoder: JSONDecoder? = nil) -> PrimitiveSequence<TraitType, T> where T: Decodable {
        return self
            .map { string in string.data(using: .utf8) ?? Data() }
            .map(type, using: decoder)
    }
}
