//
//  TradingChartView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 29/1/2024.
//

import SwiftUI
import Charts

struct TradingChartView: View {
    var body: some View {
        VStack {
            Chart {
                LineMark(
                    x: .value("Day", "Day 1"),
                    y: .value("Expense", 450)
                )
                
                LineMark(
                    x: .value("Day", "Day 2"),
                    y: .value("Expense", 380)
                )
                
                LineMark(
                    x: .value("Day", "Day 3"),
                    y: .value("Expense", 520)
                )
                LineMark(
                    x: .value("Day", "Day 4"),
                    y: .value("Expense", 480)
                )
            }
        }
        .padding()
        .frame(maxWidth: 360, maxHeight: 120)
        .background(Color(.systemGray6))
    }
}

#Preview {
    TradingChartView()
}
