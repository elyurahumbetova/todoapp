//
//  HeaderView.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 150,height: 150)
            Text("Todo")
                .font(.system(size: 20))
                .fontWeight(.bold)
                
        }
    }
}

#Preview {
    HeaderView()
}
