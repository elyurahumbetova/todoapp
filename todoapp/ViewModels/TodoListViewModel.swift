//
//  TodoListViewModel.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import Foundation
import FirebaseFirestore
@Observable
@MainActor
class TodoListViewModel{
    var showingNewItemView = false
    var isLoading = true
    
    private let userId: String
    init(userId: String){
        self.userId = userId
        
    }
    
    func stopLoading(){
        Task{
            try? await Task.sleep(nanoseconds: 700_000_000)
            isLoading = false
        }
    }
    /// Delete to the list item
    /// parametre id:item id to delete
    ///
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete() { error in
                if let error = error {
                    print("Delete error: \(error.localizedDescription)")
                }
            }
        
    }
}
