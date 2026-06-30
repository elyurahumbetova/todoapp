//
//  MainViewModel.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import Foundation
import FirebaseAuth
@Observable
@MainActor
class MainViewModel{
    var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    var isLoading: Bool = true
    
    init(){
        handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            Task{ @MainActor in
                self?.currentUserId = user?.uid ?? ""
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                self?.isLoading = false
            }
        }
    }
    
    func didSignIn() -> Bool{
         guard Auth.auth().currentUser == nil else{
            return true
        }
        return false 
    }
}
