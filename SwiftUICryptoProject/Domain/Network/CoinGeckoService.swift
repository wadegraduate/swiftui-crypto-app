//
//  CoinGeckoService.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 14/2/2024.
//

import Foundation

public protocol NetworkSerivceable {
    var scheme: String { get }
    var host: String { get }
}

struct CoinGeckoService: NetworkSerivceable, HTTPURL {
    var urlString: String = ""
    let scheme = "https"
    let host = "api.coingecko.com"
    
    func createURL(path: String, queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
