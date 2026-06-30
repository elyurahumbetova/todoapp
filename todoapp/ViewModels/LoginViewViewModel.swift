//
//  LoginViewViewModel.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import Foundation
import FirebaseAuth

@Observable
@MainActor

class LoginViewViewModel{
    var email = ""
    var password = ""
    var errorMessage = ""
    var isLoading = false
    var currentUserId = ""
    init(){
        
    }
    
    func login() async -> Bool{
        guard validate() else{
            return false
        }
        isLoading =  true
        errorMessage = ""
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            currentUserId = result.user.uid
            isLoading = false
            return true
            
        }catch{
            errorMessage = error.localizedDescription
            isLoading = false
            return false 
        }
    }
    
    func validate() -> Bool{
        errorMessage = ""
        
        guard  !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
               !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please enter email and password"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email "
            return false
        }
        
        return true
    }
}
