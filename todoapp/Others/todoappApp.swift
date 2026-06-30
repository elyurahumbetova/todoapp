//
//  todoappApp.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI
import FirebaseCore

@main
struct todoappApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
