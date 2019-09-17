//
//  NetworkingAssembly.swift
//  ExchangeRates
//
//  Created by Serg on 03/07/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Swinject

class NetworkingAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkingInput.self) { r in
            let mapper = r.resolve(IMapper.self)!
            return Networking(mapper: mapper)
        }
        
        container.register(IMapper.self) { _ in
            MapperNetworkService()
        }
    }
}
