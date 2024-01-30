//
//  ButtonBox.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 29/1/2024.
//

import SwiftUI

struct ButtonBox: View {
    
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            Button(action: {
                // Your button action here
                print("Button tapped!")
            }) {
                Text("Tap Me")
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.blue, lineWidth: 2)
                    )
            }
            
            Button(action: {
                // Your button action here
                print("Button tapped!")
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
    ButtonBox()
}
