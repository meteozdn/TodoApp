//
//  CustomButton.swift
//  TodoApp
//
//  Created by Metehan Özden on 22.10.2024.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.primary)
                    Text(title)
                    .foregroundColor(.white)
            }.frame(height: 50)
                .padding(.horizontal)
            
        }
    }
}

#Preview {
    CustomButton(title: "Register") {
        print("kenan")
    }
}
