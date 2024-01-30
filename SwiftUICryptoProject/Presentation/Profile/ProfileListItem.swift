//
//  ProfileListItem.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 23/1/2024.
//

import SwiftUI

struct ProfileListItem: View {
    
    @State var image: String
    @State var name: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 28, height: 28, alignment: .center)
                .padding(.leading, 15)
            Text(name)
                .mediumFont(size: 14)
                .padding(.leading, 16)
            Spacer()
            Image("img_chevron_right")
                .padding(.trailing, 23)
        }
    }
}

#Preview {
    ProfileListItem(image: "img_profile_user_default_icon", name: "Personal Information")
}
