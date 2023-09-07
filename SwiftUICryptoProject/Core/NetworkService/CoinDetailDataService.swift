//
//  CoinDetailDataService.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 3/9/2023.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    let coin: CoinModel
    var coinSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }

        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink (receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnCoinDetails in
                self?.coinDetails = returnCoinDetails
                self?.coinSubscription?.cancel()
            })
        
    }
    
}
