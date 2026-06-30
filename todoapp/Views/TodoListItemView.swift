//
//  TodoListItemView.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI

struct TodoListItemView: View {
    let item: TodoListItem
    @State private var viewModel = TodoListItemViewViewModel()
    @State private var isDone: Bool
    
    init(item: TodoListItem){
        self.item = item
        _isDone = State(initialValue: item.isDone)
    }
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated,time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
            }
            Spacer()
            Button{
                isDone.toggle()
                viewModel.toggle(item: item,isDone: isDone)
            }label:{
                Image(systemName: isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    TodoListItemView(item: .init(
        id: "123", title: "Abone ol", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
