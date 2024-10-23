//
//  TodoListView.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    @FirestoreQuery var items: [TodoItem]
    
    init(uid: String){
        self._items = FirestoreQuery(collectionPath: "users/\(uid)/todos")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items){ item in
                    TodoListItemView(todoItem: item)
                        .swipeActions {
                            Button{
                                print("silindi")
                            }label: {
                                Image(systemName: "trash")
                            }
                            .background(Color.red)
                        }
                    
                }.listStyle(PlainListStyle())
                
            }
            .navigationTitle("Todo List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView.toggle()
                }label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }

    }
}

#Preview {
    TodoListView( uid: "x2s3t9aKeHd85FBvzaP4169jU1t2")
}
