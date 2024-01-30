//
//  TradingHeaderView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 26/1/2024.
//

import SwiftUI

struct TradingHeaderView: View {
    
    var amount: String = "$1996.08"
    
    var body: some View {
        VStack {
            Text("Wallet Value")
                .mediumFont(size: 8)
                .foregroundStyle(Color.theme.neutralSolid500)
            Text(amount)
                .heavyFont(size: 36)
                .foregroundStyle(Color.theme.neutralSolidWhite)
            HStack {
                Spacer(minLength: 100)
                Group {
                    TradingButtonView(image: "img_trading_header_buy", imageName: "Buy")
                    TradingButtonView(image: "img_trading_header_sell", imageName: "Sell")
                    TradingButtonView(image: "img_trading_header_convert", imageName: "Convert")
                }
                .frame(maxWidth: .infinity)
                Spacer(minLength: 100)
            }
        }
    }
}

#Preview {
    TradingHeaderView()
}
