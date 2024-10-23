//
//  NewItemViewModel.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//
import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewItemViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate = Date()
    @Published var showAllert = false
    @Published var message: String = ""
    
    
    init() {
        
    }
    
    func save() -> Bool {
        guard canSave() else{
            showAllert = true
            return false
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return false
        }
        
        let newItem = TodoItem(
            id: UUID().uuidString,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
        let userID = Auth.auth().currentUser?.uid ?? ""
        
        message = "Todo oluşturuldu"
        return true
    }
    
    func canSave() -> Bool {
        guard !title.isEmpty else {
            message = "Başlık boş bırakılamaz"
            return false }
        
        guard dueDate.timeIntervalSinceNow >= 0 else {
            message = "Geçerli bir tarih seçiniz"
            return false }
        
        return true
    }
}
