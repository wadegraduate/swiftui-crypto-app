//
//  SwiftUICryptoProjectApp.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 12/7/2022.
//

import SwiftUI

@main
struct SwiftUICryptoProjectApp: App {
    
    @StateObject private var viewModel = HomeViewModel(homeUseCase: HomeUseCase())
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView{
                    MainView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
            .environment(\.colorScheme, .dark)
        }
    }
}
