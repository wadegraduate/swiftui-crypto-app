//
//  MarketDataRequest.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 8/9/2023.
//

import Foundation

struct MarketDataRequest: HTTPRequestable {
    typealias ParamT = HTTPEmptyParam
    typealias ReplyT = GlobalData
    
    var method: HTTPMethod = .GET
    var url: HTTPURL = "https://api.coingecko.com/api/v3/global"
    var requestTimeOut: Float? = nil
}
