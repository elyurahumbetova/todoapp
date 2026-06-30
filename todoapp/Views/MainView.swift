//
//  ContentView.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    
    @State private var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isLoading {
            SplashView()
        }else if viewModel.currentUserId.isEmpty{
            LoginView()

        }
        
        else {
            accountView(userId: viewModel.currentUserId)
        }
    }
    
    @ViewBuilder
    
    func accountView(userId: String) -> some View{
        TabView{
            TodoListView(userId: userId)
                .tabItem{
                    Label("Tasks", systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
