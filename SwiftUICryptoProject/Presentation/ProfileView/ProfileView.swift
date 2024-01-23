//
//  ProfileView.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 19/1/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    premium
                    general
                }.navigationTitle("Setting")
            }
        }
    }
}

extension ProfileView {
    var premium: some View {
        Section("Premium") {
            NavigationLink(destination: EmptyView()) {
                Button {
                } label: {
                    HStack {
                        Image(systemName: "message")
                        Text("Personal Assistant")
                    }
                }
            }
            NavigationLink(destination: EmptyView()) {
                Button {
                } label: {
                    HStack {
                        Image(systemName: "message")
                        Text("Personal Assistant")
                    }
                }
            }
            NavigationLink(destination: EmptyView()) {
                Button {
                } label: {
                    HStack {
                        Image(systemName: "message")
                        Text("Personal Assistant")
                    }
                }
            }
        }
    }
    
    var general: some View {
        Section("General") {
            NavigationLink(destination: EmptyView()) {
                HStack {
                    Image(systemName: "message")
                    Text("Personal Assistant")
                }
            }
            NavigationLink(destination: EmptyView()) {
                Button {
                } label: {
                    HStack {
                        Image(systemName: "message")
                        Text("Personal Assistant")
                    }
                }
            }
            NavigationLink(destination: EmptyView()) {
                Button {
                } label: {
                    HStack {
                        Image(systemName: "message")
                        Text("Personal Assistant")
                    }
                }
            }
        }
    }
    
    
}


#Preview {
    ProfileView()
}



