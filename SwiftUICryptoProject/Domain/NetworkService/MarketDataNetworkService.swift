//
//  MarketDataService.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 26/8/2023.
//

import Foundation
import Combine

struct MarketDataRequest: HTTPRequestable {
    typealias ParamT = HTTPEmptyParam
    typealias ReplyT = GlobalData
    
    var method: HTTPMethod = .GET
    var url: HTTPURL = "https://api.coingecko.com/api/v3/global"
    var requestTimeOut: Float? = nil
}

protocol MarketDataNetworkServiceProtocol {
    func requestData() -> AnyPublisher<GlobalData, HTTPError>
}

class MarketDataNetworkService: MarketDataNetworkServiceProtocol {
    
    func requestData() -> AnyPublisher<GlobalData, HTTPError> {
        let request = MarketDataRequest().toJsonRequest()
        return request.start()
    }
}
