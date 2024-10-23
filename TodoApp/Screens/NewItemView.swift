//
//  NewItemView.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import SwiftUI

struct NewItemView: View {
    @Binding var newItemPresented : Bool
    @StateObject var viewModel = NewItemViewModel()
    var body: some View {
        VStack{
            Text("Yeni Görev")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 50)
            
            Form{
                TextField("Başlık", text: $viewModel.title)
                    .padding()
                DatePicker("Bitiş Tarihi", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                

            }
            .frame(height: 480)
            CustomButton(title: "Save", action: {
                if viewModel.save() {
                    newItemPresented.toggle()
                }

            })
            Spacer()
        }.alert(isPresented: $viewModel.showAllert) {
            Alert(title: Text("Hata"), message: Text(viewModel.message))
        }
        

        
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
