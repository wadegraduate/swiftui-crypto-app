//
//  CoinDataService.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 25/8/2022.
//

import Foundation
import Combine

protocol CoinDataNetworkServiceProtocol {
    func requestCoinsInfo() -> AnyPublisher<[CoinModel], HTTPError>
}

class CoinDataNetworkService: CoinDataNetworkServiceProtocol {
    
    func requestCoinsInfo() -> AnyPublisher<[CoinModel], HTTPError> {
        let request = CoinDataRequest().toJsonRequest()
        return request.start()
    }
}



