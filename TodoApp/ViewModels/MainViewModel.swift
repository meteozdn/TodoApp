//
//  MainViewModel.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import Foundation
import FirebaseAuth
class MainViewModel: ObservableObject{
    
    @Published var currentUserID = ""
    init() {
      var listener = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    public var isSignIn: Bool{
        return Auth.auth().currentUser != nil
    }
    
    
    
}
