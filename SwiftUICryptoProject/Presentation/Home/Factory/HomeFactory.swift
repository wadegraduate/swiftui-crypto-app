//
//  HomeFactory.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 11/9/2023.
//

import Foundation
import UIKit
import SwiftUI

class HomeFactory {
    static func makeHomeViewController() -> UIViewController {
        let viewModel = makeHomeViewModel()
        return UIHostingController(rootView: HomeView(viewModel: viewModel))
    }
}

extension HomeFactory {
    static func makeHomeViewModel() -> HomeViewModel {
        let useCase = HomeUseCase()
        return HomeViewModel(homeUseCase: useCase)
    }
}
