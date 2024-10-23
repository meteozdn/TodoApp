//
//  RegisterViewModel.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage = ""

    init() {
    }
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let uid = result?.user.uid else{
                return 
            }
            
            self.insertUserRecord(id: uid)
            
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty
                ,!name.trimmingCharacters(in: .whitespaces).isEmpty
                ,!password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Tüm alanları doldurun"
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else {
            errorMessage = "Geçerli bir email girin"
            return false
        }
        
        guard password.count > 6 else {
            errorMessage = "Şifreniz en az 6 karakter olmalı"
            return false
        }
        
        return true
    }
}
