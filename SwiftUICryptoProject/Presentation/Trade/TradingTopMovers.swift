//
//  TradingTopMovers.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 29/1/2024.
//

import SwiftUI

struct TradingTopMovers: View {
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                HStack {
                    Text("TopMovers")
                        .boldFont(size: 18)
                    Image("img_chevron_down")
                    Spacer()
                }
                ForEach(1..<10) { index in
                    TradingCoinRow()
                }
            }
        }
        .padding(.leading, 15)
    }
}


struct TradingCoinRow: View {
    
    
    var image: String? = nil
    var rightImage: String? = nil
    var name: String? = nil
    var symbol: String? = nil
    var price: String? = nil
    var percentage: String? = nil
    var onClick: ((Self) -> Void)?
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        
        DisclosureGroup(
            isExpanded: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/,
            content: {
                if isExpanded {
                    TradingChartView()
                    ButtonBox(primaryTitle: "Buy", secondTitle: "Sell")
                }
            },
            label: {
                coinRow
            }
        )
        .accentColor(Color.theme.background)
    }
    
    
    var coinRow: some View {
        VStack {
            Button {
                onClick?(self)
                withAnimation {
                    isExpanded.toggle()
                }
            } label: {
                HStack(alignment: .center, spacing: 8) {
                    AsyncImage(url: URL(string: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")) { phase in
                        switch phase {
                        case .empty:
                            EmptyView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        case .failure(_):
                            EmptyView()
                        @unknown default:
                            EmptyView()
                        }
                    }

                    VStack(alignment: .leading)  {
                        Text("Ethereum")
                            .mediumFont(size: 18)
                            .foregroundStyle(Color.theme.neutralSolidWhite)
                        Text("ETH")
                            .mediumFont(size: 14)
                            .foregroundStyle(Color.theme.neutralSolid400)
                    }
                    Spacer()
                    VStack {
                        Text("$1.898,81")
                            .mediumFont(size: 16)
                            .foregroundStyle(Color.theme.neutralSolidWhite)
                        Text("$1.64%")
                            .mediumFont(size: 12)
                            .foregroundStyle(Color.theme.red)
                            .alignmentGuide(.leading) { distance in distance[.leading]}
                    }
                    
                    Image("img_chevron_down")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .rotationEffect(isExpanded ? .degrees(180) : .degrees(0))
                }
            }
        }
        .padding(.trailing, -20)
    }
}


#Preview {
    TradingTopMovers()
}
