//
//  User.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import Foundation


struct User: Codable{
    let name: String
    let id: String
    let email:String
    let joined: TimeInterval
}
