//
//  CoinDataUseCase.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 6/9/2023.
//

import Foundation
import Combine

protocol HomeUseCaseProtocol {
    func getCoinsInfo() -> AnyPublisher<[CoinModel], HTTPError>
    func getMarketDataInfo() -> AnyPublisher<MarketDataModel?, HTTPError>
}

class HomeUseCase: HomeUseCaseProtocol {
    
    private let coinDataNetworkService: CoinDataNetworkServiceProtocol
    private let marketDataNetworkService: MarketDataNetworkServiceProtocol
    
    init(coinDataNetworkService: CoinDataNetworkServiceProtocol = CoinDataNetworkService(),
         marketDataNetworkService: MarketDataNetworkServiceProtocol = MarketDataNetworkService()) {
        self.coinDataNetworkService = coinDataNetworkService
        self.marketDataNetworkService = marketDataNetworkService
    }
    
    func getCoinsInfo() -> AnyPublisher<[CoinModel], HTTPError> {
        return coinDataNetworkService.requestCoinsInfo()
    }
    
    func getMarketDataInfo() -> AnyPublisher<MarketDataModel?, HTTPError> {
        return marketDataNetworkService.requestData()
            .map( {$0.data})
            .eraseToAnyPublisher()
    }
}
