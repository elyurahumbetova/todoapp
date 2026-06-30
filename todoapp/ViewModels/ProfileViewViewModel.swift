//
//  ProfileViewViewModel.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
@MainActor
class ProfileViewViewModel{
    
    var user: User? = nil
    init(){
        
    }
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else {return}
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId)
            .getDocument{ [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else{
                    return
                }
                
                DispatchQueue.main.async{
                    self?.user = User(
                        name: data["name"] as? String ?? "",
                        id: data["id"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["joined"] as? TimeInterval ?? 0)
                }
                
                
            }
        
    }
    func logout(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
    
}
