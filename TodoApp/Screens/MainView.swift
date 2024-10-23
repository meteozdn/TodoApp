//
//  ContentView.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        
        if viewModel.isSignIn, !viewModel.currentUserID.isEmpty {
            accountViewBuilder
        }else{

            LoginView()
        }
    }
    @ViewBuilder
    var accountViewBuilder: some View{
        
            TabView{
                TodoListView(uid: viewModel.currentUserID)
                    .tabItem {
                        Label("TODO's", systemImage: "checklist")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }

            }

    }
}

#Preview {
    MainView()
}
