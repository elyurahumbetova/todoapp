//
//  NewItemView.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI

struct NewItemView: View {
    @Binding var newItemPresented: Bool
    
    @State private var viewModel = NewItemViewViewModel()
    var body: some View {
        
        VStack{
            Text("New task")
                .font(.title)
                .bold()
                .padding(.top,10)
            
            Form{
                TextField("Title",text: $viewModel.title)
                
                DatePicker("Due date",selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                BigButton(action: {
                    
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                        
                    
                }, text: "Save")
                
            }
            .alert(isPresented: $viewModel.showAlert,content: {
                Alert(title: Text("ERROR"),message: Text("Pls check the validation of informations "))
            })
        }
    }
}

//#Preview {
//    NewItemView()
//}
