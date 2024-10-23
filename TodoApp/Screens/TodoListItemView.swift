//
//  TodoListItemView.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewModel()
    let todoItem: TodoItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(todoItem.title)
                    .font(.title)
                Text("\(Date(timeIntervalSince1970: todoItem.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            Button{
                viewModel.todoIsDone(item: todoItem)
            }label:{
                Image(systemName: todoItem.isDone ? "checkmark.circle" : "circle")
            }
        }
    }
}

#Preview {
    TodoListItemView(todoItem: TodoItem(id: "123", title: "Merhaba", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970))
}
