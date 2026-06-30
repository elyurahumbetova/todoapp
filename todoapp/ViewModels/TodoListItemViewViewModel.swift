//
//  TodoListItemViewViewModel.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
@MainActor
class TodoListItemViewViewModel {
    private var debounceTask: Task<Void, Never>?
    
    init() {}
    
    func toggle(item: TodoListItem,isDone: Bool) {
        debounceTask?.cancel()
        
        debounceTask = Task {
            do {
                try await Task.sleep(nanoseconds: 500_000_000)
                
                guard let uid = Auth.auth().currentUser?.uid else { return }
                
                let db = Firestore.firestore()
                try await db.collection("users")
                    .document(uid)
                    .collection("todos")
                    .document(item.id)
                    .updateData(["isDone": isDone])
                    
            } catch {
            }
        }
    }
}
