//
//  CoinDataRequest.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 8/9/2023.
//

import Foundation

struct CoinDataRequest: HTTPRequestable {
    typealias ParamT = HTTPEmptyParam
    typealias ReplyT = [CoinModel]
    
    var method: HTTPMethod = .GET
    var url: HTTPURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    var requestTimeOut: Float? = nil
}
