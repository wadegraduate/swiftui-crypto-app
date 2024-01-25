//
//  ProfileView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 19/1/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                List {
                    ProfileHeaderView()
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                    
                    ForEach(profileGroups) { group in
                        Section(header: Text(group.groupName)
                            .boldFont(size: 18)
                            .foregroundStyle(Color.theme.neutralSolidWhite)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 30, trailing: 0))
                        ) {
                            ForEach(group.rows) { row in
                                ProfileListItem(image: row.image, name: row.name)
                            }
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.theme.background)
                        .listRowSeparator(.hidden)
                    }
                }
                .padding(.top)
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
                
        }
    }
}

struct ProfileGroup: Identifiable {
    var id = UUID()
    var groupName: String
    var rows: [Row]
    
    struct Row: Identifiable {
        var id = UUID()
        var image: String
        var name: String
    }
}

let profileGroups = [
    ProfileGroup(groupName: "My Account", rows: [
        ProfileGroup.Row(image: "img_profile_profile", name: "Personal Information"),
        ProfileGroup.Row(image: "img_profile_lock", name: "Password & Security"),
        ProfileGroup.Row(image: "img_profile_account_setting", name: "Account Settings")
    ]),
    
    ProfileGroup(groupName: "Investment", rows: [
        ProfileGroup.Row(image: "img_profile_txn_history", name: "Transaction History"),
        ProfileGroup.Row(image: "img_profile_staking", name: "Staking"),
    ]),
    
    ProfileGroup(groupName: "Community", rows: [
        ProfileGroup.Row(image: "img_profile_contacts", name: "Contacts"),
        ProfileGroup.Row(image: "img_profile_tell_a_friend", name: "Tell a friend"),
    ]),
    
    ProfileGroup(groupName: "Support", rows: [
        ProfileGroup.Row(image: "img_profile_helpdesk", name: "Helpdesk Articles"),
        ProfileGroup.Row(image: "img_profile_contact_us", name: "Contact Us"),
    ])
]


#Preview {
    ProfileView()
}

