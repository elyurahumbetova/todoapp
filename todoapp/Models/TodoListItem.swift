//
//  TodoListItem.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import Foundation


struct TodoListItem: Codable,Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
    isDone = state
        
    }
}
