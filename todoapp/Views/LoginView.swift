//
//  LOginView.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewViewModel()
    @State private var navigateTodoList = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // header
                HeaderView()

                // form
                VStack(spacing: 16) {
                   
                    AppTextField(title: "Enter your email", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        
                    AppTextField(title: "Enter your password", text: $viewModel.password)

                }
                .padding()
               

                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .font(.footnote)
                        .foregroundStyle(.red)
                }

                Spacer()

                // footer
                BigButton(
                    action: {
                    
                    Task{
                        let success = await viewModel.login()
                        if success {
                            navigateTodoList = true
                        }
                    }
                },text: viewModel.isLoading ? "Loading" : "Sign in")
                .disabled(viewModel.isLoading)
         
                   Spacer()


                VStack(spacing: 8){
                    Text("Are you new here?")
                    NavigationLink("Tap for register", destination: RegisterView())
                }
            }
            .padding(.horizontal)
            .navigationDestination(isPresented: $navigateTodoList) {
                TodoListView(userId: viewModel.currentUserId )
                        }
        }
    }
}

#Preview {
    LoginView()
}
