//
//  ProfileTopView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 23/1/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("img_profile_user_default_icon")
                .frame(width: 64, height: 64)
                .padding(.leading, 15)
                .onTapGesture {
                }
            VStack(alignment: .leading) {
                Text("Oguz UNAL")
                    .mediumFont(size: 14)
                Text("1oguzunal@gmail.com")
                    .mediumFont(size: 10)
                    .foregroundStyle(Color.theme.neutralSolid400)
            }
            Image("img_chevron_down")
                .frame(width: 24, height: 24)
            Spacer()
        }
    }
}

#Preview {
    ProfileHeaderView()
}
