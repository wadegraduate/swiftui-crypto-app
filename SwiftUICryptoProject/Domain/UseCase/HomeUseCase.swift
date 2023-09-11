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
    func getSavedEntities() -> AnyPublisher<[PortfolioEntity], Never>
}

class HomeUseCase: HomeUseCaseProtocol {
    
    private let coinDataNetworkService: CoinDataNetworkServiceProtocol
    private let marketDataNetworkService: MarketDataNetworkServiceProtocol
    private let portfolioDataRepository: PortfolioLocalDataRepositoryProtocol
    
    init(coinDataNetworkService: CoinDataNetworkServiceProtocol = CoinDataNetworkService(),
         marketDataNetworkService: MarketDataNetworkServiceProtocol = MarketDataNetworkService(),
         portfolioDataRepository: PortfolioLocalDataRepositoryProtocol = PortfolioLocalDataRepository()) {
        self.coinDataNetworkService = coinDataNetworkService
        self.marketDataNetworkService = marketDataNetworkService
        self.portfolioDataRepository = portfolioDataRepository
    }
    
    func getCoinsInfo() -> AnyPublisher<[CoinModel], HTTPError> {
        return coinDataNetworkService.requestCoinsInfo()
    }
    
    func getMarketDataInfo() -> AnyPublisher<MarketDataModel?, HTTPError> {
        return marketDataNetworkService.requestData()
            .map( {$0.data})
            .eraseToAnyPublisher()
    }
    
    func getSavedEntities() -> AnyPublisher<[PortfolioEntity], Never> {
        return portfolioDataRepository.savedEntitiesPublisher.eraseToAnyPublisher()
    }
    
}
