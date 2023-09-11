//
//  MarketDataService.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 26/8/2023.
//

import Foundation
import Combine

protocol MarketDataNetworkServiceProtocol {
    func requestData() -> AnyPublisher<GlobalData, HTTPError>
}

class MarketDataNetworkService: MarketDataNetworkServiceProtocol {
    
    func requestData() -> AnyPublisher<GlobalData, HTTPError> {
        let request = MarketDataRequest().toJsonRequest()
        return request.start()
    }
}
