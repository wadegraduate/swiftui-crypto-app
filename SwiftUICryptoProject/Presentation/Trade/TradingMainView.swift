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
            }
            .navigationTitle("Trading")
           
        
        }
      }
}

#Preview {
    TradingMainView()
}
