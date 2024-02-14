//
//  ButtonBox.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 29/1/2024.
//

import SwiftUI

struct ButtonBox: View {
    let primaryTitle: String
    let secondTitle: String
  
    var onPrimaryButtonClick: (() -> Void)? = nil
    var onSecondaryButtonClick: (() -> Void)? = nil
        
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            Button(action: {
                onPrimaryButtonClick?()
            }) {
                Text("Tap Me")
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button(action: {
                onSecondaryButtonClick?()
            }) {
                Text("Tap Me")
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.blue, lineWidth: 2)
                    )
            }
        }
        .padding(0)
    }
}

#Preview {
    ButtonBox(primaryTitle: "Primary", secondTitle: "Secondary")
}
