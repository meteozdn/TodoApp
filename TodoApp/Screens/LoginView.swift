//
//  LoginView.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                //Header
                HeaderView()
                    .padding()
                //Email textField

                Form{

                    TextField("e-mail", text: $viewModel.email)                    .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("password", text: $viewModel.password )
                }.frame(height: 150)
                
                CustomButton(title: "Login") {
                    viewModel.login()
                    print(viewModel.errorMessage)
                }
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.callout)
                        .bold()
                }

                Spacer()
                VStack{
                    Text("Hesabın yok mu")
                    NavigationLink("Yeni Hesap Oluştur", destination: RegisterView())
                        .font(.system(.headline))
                }
            }
        }
        
    }
}

#Preview {
    LoginView()
}
