//
//  Text.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 23/1/2024.
//

import SwiftUI

extension Text {
    func mediumFont(size: CGFloat) -> some View {
        return self.font(
            Font.custom("Poppins-Medium", size: size)
        )
    }
    
    func boldFont(size: CGFloat) -> some View {
        return self.font(
            Font.custom("Poppins-Bold", size: size)
        )
    }
}
