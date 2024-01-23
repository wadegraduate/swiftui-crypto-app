//
//  MainView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 19/1/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Label("Market",systemImage: "hexagon.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile",systemImage: "person.circle.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
