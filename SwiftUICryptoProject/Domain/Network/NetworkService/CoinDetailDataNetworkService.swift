//
//  CoinDetailDataService.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 3/9/2023.
//

import Foundation
import Combine

protocol CoinDetailDataNetworkServiceProtocol {
    func requestCoinDetailData(coinID: String) -> AnyPublisher<CoinDetailModel, HTTPError>
}

class CoinDetailDataNetworkService: CoinDetailDataNetworkServiceProtocol {
    
    func requestCoinDetailData(coinID: String) -> AnyPublisher<CoinDetailModel, HTTPError> {
        let request = CoinDetailRequest(coinID: coinID).toJsonRequest()
        return request.start()
    }
}
