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
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading) {
                Text("Wallet Value")
                    .mediumFont(size: 8)
                    .foregroundStyle(Color.theme.neutralSolid500)
                
                Text(amount)
                    .boldFont(size: 36)
                    .foregroundStyle(Color.theme.neutralSolidWhite)
                    .padding(.bottom, 16)
            }
            
            HStack(alignment: .center, spacing: 12) {
                Spacer(minLength: 0)
                TradingButtonView(image: "img_trading_header_buy", imageName: "Buy")
                Spacer(minLength: 0)
                TradingButtonView(image: "img_trading_header_sell", imageName: "Sell")
                Spacer(minLength: 0)
                TradingButtonView(image: "img_trading_header_convert", imageName: "Convert")
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TradingHeaderView()
}
