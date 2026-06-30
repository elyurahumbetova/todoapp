//
//  RegisterView.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI

struct RegisterView: View {
   @State private var viewModel = RegisterViewViewModel()
    @State private var navigateToDoList = false
    @FocusState private var focused : Bool
    var body: some View {
        NavigationStack{

        VStack(spacing: 24) {
                //            header
                HeaderView()
                
                //            register form
                VStack(alignment: .leading, spacing: 15){
                    Text("Register")
                    AppTextField(title: "UserName", text: $viewModel.userName)
                    AppTextField(title:"Enter your email",text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            

                    AppTextField(title:"Enter your password", text: $viewModel.password,isSecure: true)

                }
                .padding()
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                        .font(.footnote)
                }
                Spacer()
                BigButton(action: {
                    Task{
                        let success = await  viewModel.register()
                        if success {
                            navigateToDoList = true
                        }
                    }
                    
                }
                ,text: viewModel.isLoading ? "Loading..." : "Register")
                .disabled(viewModel.isLoading)
                   
                
            }
            .padding()
            .navigationDestination(isPresented: $navigateToDoList){
                TodoListView(userId: viewModel.currentUserId)
            }
        }
    }
}

#Preview {
    RegisterView()
}
