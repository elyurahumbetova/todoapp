//
//  RegisterViewViewModel.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
@Observable
@MainActor
class RegisterViewViewModel{
    var userName = ""
    var email = ""
    var password = ""
    var errorMessage = ""
    var isLoading = false
    var currentUserId = ""
    init(){
        
    }
    
    func register() async -> Bool{
        guard validate() else{
            return false
        }
        isLoading = true
        errorMessage = ""
        
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            currentUserId = result.user.uid
            
            try await insertUserRecord(id: result.user.uid)
            
            isLoading = false
            
            return true
        }catch{
            errorMessage = error.localizedDescription
            isLoading = false
            return false
        }
    }
    
    
    
    private func insertUserRecord(id: String) async throws {
        let newUser = User(name: userName, id: id, email: email, joined: Date().timeIntervalSince1970 )
        
        let db = Firestore.firestore()
        
         try await db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        
        if userName.isEmpty || email.isEmpty || password.isEmpty{
            errorMessage = "Fill all the fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email "
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password should be at least 6 characters"
            return false
        }
        return true
    }
}
