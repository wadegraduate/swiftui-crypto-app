//
//  HomeVM.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 24/8/2022.
//
import Foundation
import Combine

class HomeViewModel: ObservableObject {

    
    @Published var statistic: [StatisticModel] = []
    @Published var marketData: MarketDataModel?
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var sortOption: SortOption = .holdings

    private let portfolioDataService = PortfolioDataService()
    private let homeUseCase: HomeUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    enum SortOption {
        case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
    }
    
    init(homeUseCase: HomeUseCaseProtocol) {
        self.homeUseCase = homeUseCase
        addSubscribers()
    }
    
    func addSubscribers() {
        // update coins
        $searchText
            .combineLatest($allCoins, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortCoin)
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
        
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoin)
            .sink { [weak self] returnedCoins in
                guard let self = self else { return }
                self.portfolioCoins = self.sortPortfolioCoinsIfNeeded(coins: returnedCoins)
                
            }
            .store(in: &cancellables)
        
        
        // updates markets data
        $marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedStatistics in
                self?.statistic = returnedStatistics
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        //change this to useCase
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
}

// MARK: -  Data Request
extension HomeViewModel {
    func requestData() {
        isLoading = true
        homeUseCase.getCoinsInfo()
            .sink { [weak self] result in
                switch result {
                case .success(let response):
                    self?.allCoins = response
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .store(in: &cancellables)
        
        homeUseCase.getMarketDataInfo()
            .sink(result: { [weak self] result in
                switch result {
                case .success(let response):
                    self?.marketData = response
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
            .store(in: &cancellables)
        
    }
    
    func reloadData() {
        requestData()
        HapticManager.notification(type: .success)
    }
}

// MARK: - MAPPING
extension HomeViewModel {
    private func filterAndSortCoin(text: String, coins: [CoinModel], sort: SortOption) -> [CoinModel] {
        var updatedCoins = filterCoins(text: text, coins: coins)
        sortCoins(sort: sort, coins: &updatedCoins)
        return updatedCoins
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else { return coins }
        let lowercasedText = text.lowercased()
        return coins.filter { coin -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    
    private func sortCoins(sort: SortOption, coins: inout [CoinModel])  {
        switch sort {
        case .rank, .holdings:
            coins.sort(by: { $0.rank < $1.rank })
        case .rankReversed, .holdingsReversed:
            coins.sort(by: { $0.rank > $1.rank })
        case .price:
            coins.sort(by: { $0.currentPrice > $1.currentPrice })
        case .priceReversed:
            coins.sort(by: { $0.currentPrice < $1.currentPrice })
        }
    }
    
    private func sortPortfolioCoinsIfNeeded(coins: [CoinModel]) -> [CoinModel] {
        // only sory by holdings or reverseholdings if needed
        switch sortOption {
        case .holdings:
            return coins.sorted(by: {$0.currentHoldingsValue > $1.currentHoldingsValue })
        case .holdingsReversed:
            return coins.sorted(by: {$0.currentHoldingsValue < $1.currentHoldingsValue })
        default:
            return coins
        }
    }
    
    private func mapAllCoinsToPortfolioCoin(allcoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
        return allcoins.compactMap { coin -> CoinModel? in
            guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                return nil
            }
            return coin.updateHoldings(amount: entity.amount)
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        guard let data = marketDataModel else { return stats }
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDomminance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolioValue = portfolioCoins
            .map { $0.currentHoldingsValue }
            .reduce(0, +)
        
        let portfolioPreviousValue = portfolioCoins
            .map { coin -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentChange = coin.priceChangePercentage24H ?? 0 / 100
                let previousValue = currentValue / (1 + percentChange)
                return previousValue
            }
            .reduce(0, +)
        
        let precentageChange = ((portfolioValue - portfolioPreviousValue) / portfolioPreviousValue) * 100
        
        let portfoilo = StatisticModel(title: "Portfolio", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: precentageChange)
        stats.append(contentsOf: [marketCap, volume, btcDomminance, portfoilo])
        return stats
    }
}
