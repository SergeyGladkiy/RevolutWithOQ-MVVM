//
//  Mapper.swift
//  ExchangeRates
//
//  Created by Serg on 10/07/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

enum NSURLError: Error {
    
    case unknown
    case cancelled
    case badURL
    case timedOut
    case cannotFindHost
    case notConnectedToInternet
    
    var message: String {
        switch self {
        case .badURL:
            return "Bad URL"
        case .cancelled:
            return "Cancelled"
        case .notConnectedToInternet:
            return "not connected to internet"
        case .timedOut:
            return "Time out"
        case .cannotFindHost:
            return "A server with the specified hostname could not be found"
        case .unknown:
            return "unknow"
        }
    }
    
}

class MapperNetworkService: IMapper {
    
//    case unknown//= -1 //
//    case cancelled //= -999
//    case badURL //= //-1000 //
//    case timedOut //= //-1001 //
//    case cannotFindHost //= -1003 //
//    case notConnectedToInternet //= -1009 //
    
    func parsingError(error: NSError) -> NSURLError {
        switch error.code {
        case -999:
            return .cancelled
        case -1000:
            return .badURL
        case -1001:
            return .timedOut
        case -1003:
            return .cannotFindHost
        case -1009:
            return .notConnectedToInternet
        default:
            return .unknown
        }
    }

}
