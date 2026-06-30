//
//  AppTextField.swift
//  todoapp
//
//  Created by Elyura on 27.06.26.
//

import SwiftUI

struct AppTextField: View {
    let title: String
    @Binding var text: String
    var isSecure = false
    @FocusState private var focused: Bool

    var body: some View {
        Group {
            if isSecure {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
        }
        .focused($focused)
        .padding(12)
        .overlay {
            RoundedRectangle(cornerRadius: 26)
                .stroke(focused ? .blue : .gray, lineWidth: 1)
        }
    }
}

//#Preview {
//    AppTextField()
//}
