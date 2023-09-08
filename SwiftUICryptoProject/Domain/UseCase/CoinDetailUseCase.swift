//
//  DetailPageUaseCase.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 7/9/2023.
//

import Foundation
import Combine

protocol CoinDetailUseCaseProtcol {
    func getCoinsDetail(coinID: String) -> AnyPublisher<CoinDetailModel, HTTPError>
}

class CoinDetailUseCase: CoinDetailUseCaseProtcol {
    
    let networkService: CoinDetailDataNetworkServiceProtocol
    
    init(networkService: CoinDetailDataNetworkServiceProtocol = CoinDetailDataNetworkService()) {
        self.networkService = networkService
    }
    
    func getCoinsDetail(coinID: String) -> AnyPublisher<CoinDetailModel, HTTPError> {
        networkService.requestCoinDetailData(coinID: coinID)
    }
}
