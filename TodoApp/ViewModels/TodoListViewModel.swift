//
//  TodoListViewModel.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//
import Foundation
import FirebaseAuth

class TodoListViewModel: ObservableObject{
    @Published var showingNewItemView: Bool = false
    
    init(){
        
    }
    
    func delete(uid: String) -> Bool {
        return false
    }
    
    func addToDo(){
        print("add")
    }
}
