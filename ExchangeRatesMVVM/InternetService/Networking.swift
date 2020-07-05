//
//  EntityExchangeRates.swift
//  ExchangeRates
//
//  Created by Serg on 06/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

struct Pair: Decodable {
    let name: String
    let value: Float
}

public func duration(_ block: () -> ()) -> TimeInterval {
  let startTime = Date()
  block()
  return Date().timeIntervalSince(startTime)
}

typealias CurrencyExchangeCompletion = (Result<[String: Float], NSURLError>)-> Void

class Networking: NetworkingInput {
    private var mapper: IMapper!
    //private let pendingOperation = PendingOperations()
    
    init(mapper: IMapper) {
        self.mapper = mapper
    }
    
    func getExchangeRates(_ stringForUrl: String, completion: @escaping CurrencyExchangeCompletion) {
        
        let urlString = "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios?\(stringForUrl)"
        
        guard let url = URL(string: urlString) else { return }
        
        var arrayOperation = [Operation]()
        let operationQueue = OperationQueue()
        //operationQueue.maxConcurrentOperationCount = 1
        
        for _ in (0...10) {
            let operation = DataDownloader(url: url) { data, error in
                if let error = error {
                    let customError = self.mapper.parsingError(error: error as NSError)
                    completion(.failure(customError))
                    return
                }
                
                // successful
                do {
                    let pairs = try JSONDecoder().decode([String: Float].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completion(.success(pairs))
                    }
                } catch let error {
                    let customError = self.mapper.parsingError(error: error as NSError)
                    completion(.failure(customError))
                }
            }
            
            arrayOperation.append(operation)
        }
        
        operationQueue.addOperations(arrayOperation, waitUntilFinished: false)
        // duration of executing all operations
//        let time = duration {
//            operationQueue.addOperations(arrayOperation, waitUntilFinished: true)
//        }
//        print(time)
        
    }
}
