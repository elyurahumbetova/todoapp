//
//  BigButton.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI

struct BigButton: View {
    let action: () -> Void
    let text: String
    
    var body: some View {
        Button(action: action){
            Text(text)
                .foregroundStyle(Color(.white))
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical)
        .background(Color(.blue))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        
    }
    
    
}
