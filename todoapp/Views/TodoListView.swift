//
//  TodoListView.swift
//  todoapp
//
//  Created by Elyura on 26.06.26.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    @State private var viewModel: TodoListViewModel
    @FirestoreQuery var items: [TodoListItem]

    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = State(wrappedValue: TodoListViewModel(userId: userId))
    }

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if items.isEmpty {
                    emptyView
                } else {
                    listView
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            .onAppear {
                viewModel.stopLoading()
            }
        }
    }

    private var listView: some View {
        List(items) { item in
            TodoListItemView(item: item)
                .swipeActions {
                    Button("Delete", role: .destructive) {
                        viewModel.delete(id: item.id)
                    }
                }
        }
        .listStyle(.plain)
    }

    private var emptyView: some View {
        VStack(spacing: 12) {
            Image(systemName: "checkmark.circle")
                .font(.system(size: 60))
                .foregroundStyle(.gray)

            Text("No tasks yet")
                .foregroundStyle(.gray)

            Text("Tap + to add one")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
#Preview {
    TodoListView(userId: "Xe1ltXUBy3R4XfMbZpjJIfYXEBw1")
}
