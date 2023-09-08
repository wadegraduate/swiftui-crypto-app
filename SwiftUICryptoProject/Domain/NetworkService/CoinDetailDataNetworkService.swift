//
//  CoinDetailDataService.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 3/9/2023.
//

import Foundation
import Combine

struct CoinDetailRequest: HTTPRequestable {
    typealias ParamT = HTTPEmptyParam
    typealias ReplyT = CoinDetailModel
    
    var method: HTTPMethod = .GET
    var url: HTTPURL {
        return "https://api.coingecko.com/api/v3/coins/\(coinID)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
    }
    var requestTimeOut: Float? = nil
    let coinID: String
    
    init(coinID: String) {
        self.coinID = coinID
    }
}

protocol CoinDetailDataNetworkServiceProtocol {
    func requestCoinDetailData(coinID: String) -> AnyPublisher<CoinDetailModel, HTTPError>
}

class CoinDetailDataNetworkService: CoinDetailDataNetworkServiceProtocol {
    
    func requestCoinDetailData(coinID: String) -> AnyPublisher<CoinDetailModel, HTTPError> {
        let request = CoinDetailRequest(coinID: coinID).toJsonRequest()
        return request.start()
    }
}


