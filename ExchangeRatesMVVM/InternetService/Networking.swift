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

typealias CurrencyExchangeCompletion = (Result<[String: Float], NSURLError>)-> Void

class Networking: NetworkingInput {
    private var mapper: IMapper!
    private let pendingOperation = PendingOperations()
    
    init(mapper: IMapper) {
        self.mapper = mapper
    }
    
    func getExchangeRates(_ stringForUrl: String, completion: @escaping CurrencyExchangeCompletion) {
        
        let urlString = "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios?\(stringForUrl)"
        
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
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
        }.resume()
        
            
        
//        let operation1 = DataDownloader(task)
//        operation1.completionBlock = {
//            print("1-\(operation1.isFinished)")
//            print(Thread.current)
//        }
//        //pendingOperation.downloadQueue.addOperation(operation1)
//        //operation1.waitUntilFinished()
//
//
//        let operation2 = DataDownloader(task)
//        operation2.completionBlock = {
//            print("2-\(operation2.isFinished)")
//            print(Thread.current)
//        }
//        //pendingOperation.downloadQueue.addOperation(operation2)
//        //operation2.waitUntilFinished()
//
//        let operation3 = DataDownloader(task)
//        operation3.completionBlock = {
//            print("3-\(operation3.isFinished)")
//            print(Thread.current)
//        }
//        //operation3.waitUntilFinished()
//        //pendingOperation.downloadQueue.addOperation(operation3)
//        //operation1.addDependency(operation3)
//        //operation2.addDependency(operation3)
//        pendingOperation.downloadQueue.addOperations([operation1, operation2, operation3], waitUntilFinished: true)
    }
}
