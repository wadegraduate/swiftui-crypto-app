//
//  Tab.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 24/1/2024.
//

import Foundation

enum Tab {
    case home
    case trade
    case portfoilo
    case profile
    
    var defaultImage: String {
        switch self {
        case .home:
            return "img_tabbar_home"
        case .trade:
            return "img_tabbar_trade"
        case .portfoilo:
            return "img_tabbar_portfolio"
        case .profile:
            return "img_tabbar_profile"
        }
    }
    
    var selectedImage: String {
        switch self {
        case .home:
            return "img_tabbar_home_selected"
        case .trade:
            return "img_tabbar_trade_selected"
        case .portfoilo:
            return "img_tabbar_portfolio_selected"
        case .profile:
            return "img_tabbar_profile_selected"
        }
    }
    
    var name: String {
        switch self {
        case .home:
            return "home"
        case .trade:
            return "trade"
        case .portfoilo:
            return "portfoilo"
        case .profile:
            return "profile"
        }
    }
}
