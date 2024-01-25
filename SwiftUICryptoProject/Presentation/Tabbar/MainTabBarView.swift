//
//  MainTabBarView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 24/1/2024.
//

import SwiftUI

struct MainTabBarView: View {
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        ZStack{
            TabView(selection: $selectedTab,content:  {
                Group {
                    NavigationStack {
                        HomeView(viewModel: HomeViewModel())
                    }
                    .tag(Tab.home)
                    
                    NavigationStack {
                        
                    }
                    .tag(Tab.trade)
                    
                    NavigationStack {
                        
                    }
                    .tag(Tab.portfoilo)
                    
                    NavigationStack {
                        ProfileView()
                    }
                    .tag(Tab.profile)
                }
                .toolbar(.hidden, for: .tabBar)
            })
            
            VStack{
                Spacer()
                tabBar
            }
//            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
//                Rectangle().fill(Color.theme.neutralSolidBlack)
//                    .frame(height: 20)
//            }
            .ignoresSafeArea()
        }
    }
}

extension MainTabBarView {
    
    var tabBar: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        selectedTab = .home
                    }
                }, label: {
                    MainTabBarItemView(tab: .home, isSelected: selectedTab == .home)
                })
                Spacer()
                
                Button(action: {
                    withAnimation {
                        selectedTab = .trade
                    }
                }, label: {
                    MainTabBarItemView(tab: .trade, isSelected: selectedTab == .trade)
                })
                Spacer()
                
                Button(action: {
                    withAnimation {
                        selectedTab = .portfoilo
                    }
                }, label: {
                    VStack(alignment: .center, content: {
                        MainTabBarItemView(tab: .portfoilo, isSelected: selectedTab == .portfoilo)
                    })
                })
                Spacer()
                
                Button(action: {
                    withAnimation {
                        selectedTab = .profile
                    }
                }, label: {
                    MainTabBarItemView(tab: .profile, isSelected: selectedTab == .profile)
                })
                Spacer()
                
            }
            .padding(.bottom, 20)
        }
        .frame(height: 100)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.black)
        }
    }
}


#Preview {
    MainTabBarView()
}
