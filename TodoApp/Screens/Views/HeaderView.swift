//
//  Header.swift
//  TodoApp
//
//  Created by Metehan Özden on 22.10.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            Text("TodoApp")
                .font(.system(size: 30, weight: .black))
                
        }    }
}

#Preview {
    HeaderView()
}
