//
//  TodoListItem.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import Foundation
struct TodoItem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool = false
    
    mutating func setDone(state: Bool){
        self.isDone = state
    }
}
