//
//  TodoListItemViewModel.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import Foundation

class TodoListItemViewModel: ObservableObject{
    
    
    init(){
        
    }
    
    func todoIsDone(item: TodoItem ){
    //    item.isDone.toggle()
        print(item.title)
    }
}
