//
//  Operation.swift
//  ExchangeRates
//
//  Created by Serg on 22/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class DataDownloader: AsyncOperation {
    let url: URL
    var completion: ((Data?, Error?) -> ())
    init(url: URL, completionBlock: @escaping (Data?, Error?)-> Void) {
        self.url = url
        self.completion = completionBlock
    }
    
    override func main() {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.completion(data, error)
            self.state = .finished
        }

        task.resume()
        
       
    }
   
}

