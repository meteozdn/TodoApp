//
//  LoginViewModel.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage = ""
    init() {
    }
    
    func login(){
        guard validate() else {
            return
        }
        

    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty
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
        
        return true
    }
}
