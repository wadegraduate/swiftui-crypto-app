//
//  TradingMainView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 26/1/2024.
//

import SwiftUI

struct TradingMainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                TradingHeaderView()
                Spacer(minLength: 40)
                TradingTopMovers()
                Spacer()
            }
            .safeAreaInset(edge: .top) {
                HStack {
                    Text("Trading")
                        .boldFont(size: 32)
                        .padding(.horizontal)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    TradingMainView()
}
