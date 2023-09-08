//
//  HomeStatisticView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 26/8/2023.
//

import SwiftUI

struct HomeStatisticView: View {
    
    @StateObject private var viewModel: HomeViewModel
    @Binding var showPortoilo: Bool
    
    public init(viewModel: HomeViewModel, showPortoilo: Binding<Bool>) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._showPortoilo = showPortoilo
    }
    
    var body: some View {
        HStack {
            ForEach(viewModel.statistic) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortoilo ?  .trailing : .leading)
        
    }
}

struct HomeStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatisticView(viewModel: dev.homeViewModel, showPortoilo: .constant(false))
    }
}
