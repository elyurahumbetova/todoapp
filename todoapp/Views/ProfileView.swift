//
//  ProfileView.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var viewModel = ProfileViewViewModel()
    
    init(){
        
    }
    var body: some View {
               NavigationStack {
                   VStack {
                       if let user = viewModel.user {
                           profile(user: user)
                       } else {
                           Text("Profile is loading ...")
                       }
                       
                       BigButton(action: {
                           viewModel.logout()
                       }, text: "Logout")
                   }
                   .navigationTitle("Profile")
               }
               .onAppear {
                   viewModel.fetchUser()
               }
           }
    @ViewBuilder
    
    func profile(user: User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125,height: 125)
        
        VStack{
            HStack{
                Text("Name:")
                Text(user.name)
            }
            HStack{
                Text("Email:")
                Text(user.email)
            }
            HStack{
                Text("joined time")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time: .shortened))")
            }
        }
    }
}

#Preview {
    ProfileView()
}
