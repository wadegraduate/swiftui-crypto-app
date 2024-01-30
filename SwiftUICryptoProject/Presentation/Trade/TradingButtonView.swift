//
//  TradingButtonView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 26/1/2024.
//

import SwiftUI

struct TradingButtonView: View {
    
    let image: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            Text(imageName)
                .mediumFont(size: 14)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    TradingButtonView(image: "img_trading_header_buy", imageName: "Buy")
}
