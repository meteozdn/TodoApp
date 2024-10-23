//
//  RegisterView.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @State var mail: String = ""
    @State var password: String = ""
    @StateObject var viewModel = RegisterViewModel()
    //@State var repeatPassword: String = ""
    var body: some View {
        VStack{
            //Header
            HeaderView()
                .padding()
            //Email and password
            Form {
                TextField("Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                TextField("e-mail", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
            }.frame(height: 200)
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .font(.callout)
                    .bold()
            }
            
            CustomButton(title: "Register") {
                viewModel.register()
            }

            Spacer()

        }
    }
}

#Preview {
    RegisterView()
}
