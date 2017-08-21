//
//  RxObjectMapper.swift
//  Pods
//
//  Created by Fernando on 30/1/17.
//
//

import ObjectMapper
import RxSwift

public enum RxObjectMapperError: Error {
    case parsingError
}

public extension Observable where Element:Any {
    public func mapObject< T where T:Mappable>(type:T.Type) -> Observable<T> {
        let mapper = Mapper<T>()
        
        return self.map { (element) -> T in
            guard let parsedElement = mapper.map(JSONObject: element) else {
                throw RxObjectMapperError.parsingError
            }
            
            return parsedElement
        }
    }
    
    public func mapArray< T where T:Mappable>(type:T.Type) -> Observable<[T]> {
        let mapper = Mapper<T>()
        
        return self.map { (element) -> [T] in
            guard let parsedArray = mapper.mapArray(JSONObject: element) else {
                throw RxObjectMapperError.parsingError
            }
            
            return parsedArray
        }
    }
}
