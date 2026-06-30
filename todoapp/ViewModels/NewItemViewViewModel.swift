//
//  NewItemViewViewModel.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class NewItemViewViewModel{
    
    var dueDate = Date()
    var title = ""
    var showAlert = false 
    init(){}
    func save() {
        guard canSave else{
            return 
        }
        guard let uID = Auth.auth().currentUser?.uid else{ return }
        
        let newItemId = UUID().uuidString
        let newItem = TodoListItem(id: newItemId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate:Date().timeIntervalSince1970 , isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newItemId)
            .setData(newItem.asDictionary())
    }
    
    var canSave:Bool{
        guard !title.isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400)else{
            return false 
        }
        return true
    }
    
}
