//
//  EntityScreenCurrencies.swift
//  ExchangeRates
//
//  Created by Serg on 03/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation



class ModelMainScreen {
    
    private var mapperModelMainScreen: MapperMainScreenInterface
    private let currenciesFileName = "currencies"
    
    private var dictionaryCurrencies = [String: String]()
    
    init(mapper: MapperMainScreenInterface) {
        self.mapperModelMainScreen = mapper
    }
}

extension ModelMainScreen {
    func getListCurrencies() -> [CurrencyCellViewModel] {
        return mapperModelMainScreen.makeListOfCurrencies(dictionaryCurrencies)
    }
    
    func parseDataFromJson() {
        guard let path = Bundle.main.path(forResource: currenciesFileName, ofType: "json", inDirectory: nil) else {
            return
        }
        print(path)
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: [])
            if let jsonResult = jsonResult as? Dictionary<String, String> {
                print(jsonResult)
                dictionaryCurrencies = jsonResult
            }
        } catch {
            print(error)
        }
        
    }
}
