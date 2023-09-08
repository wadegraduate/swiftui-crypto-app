//
//  DetailViewModel.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 30/8/2023.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewStatistics: [StatisticModel] = []
    @Published var additionalStatistics: [StatisticModel] = []
    @Published var coinDescription: String? = nil
    @Published var coinDetails: CoinDetailModel? = nil
    @Published var coin: CoinModel
    
    private let coinDetailUseCase: CoinDetailUseCaseProtcol
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel, coinDetailUseCase: CoinDetailUseCaseProtcol = CoinDetailUseCase()) {
        self.coinDetailUseCase = coinDetailUseCase
        self.coin = coin
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        $coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] returnedArrays in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
        
        $coinDetails
            .sink { [weak self ] details in
                self?.coinDescription = details?.readableDescription
            }
            .store(in: &cancellables)
    }
    
    private func mapDataToStatistics(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> (overview: [StatisticModel], additional: [StatisticModel]) {
        //additional
        return (createOverviewArray(coinModel: coinModel),
                createAdditionalArray(coinDetailModel: coinDetailModel,
                                      coinModel: coinModel))
    }
    
    func createOverviewArray(coinModel: CoinModel) -> [StatisticModel] {
        // overview
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let overviewPricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: overviewPricePercentChange)
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
        let rank = "\(coinModel.rank)"
        let rankStat = StatisticModel(title: "Rank", value: rank)
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatisticModel(title: "Volume", value: volume)
        let overviewArray: [StatisticModel] = [priceStat, marketCapStat, volumeStat]
        return overviewArray
    }
    
    func createAdditionalArray(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> [StatisticModel] {
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "N/A"
        let highStat = StatisticModel(title: "24h high", value: high)
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "N/A"
        let lowStat = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "N/A"
        let additionalPricePercentChange = coinModel.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: additionalPricePercentChange)
        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let additionalMarketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: additionalMarketCapPercentChange)
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "N/A" : "\(blockTime)"
        let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hasing = coinDetailModel?.hashingAlgorithm ?? "N/A"
        let hasingStat = StatisticModel(title: "Hasing Algorithm", value: hasing)
        
        let additionalArray: [StatisticModel] = [highStat,lowStat, priceChangeStat, marketCapChangeStat, blockStat, hasingStat]
        return additionalArray
    }
}


extension DetailViewModel {
    
    func fetchCoinDetail() {
        coinDetailUseCase.getCoinsDetail(coinID: coin.id)
            .sink(result: { [weak self] result in
                switch result {
                case .success(let response):
                    self?.coinDetails = response
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
            .store(in: &cancellables)
    }
}
