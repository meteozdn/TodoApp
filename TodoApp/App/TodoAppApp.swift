//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Metehan Özden on 21.10.2024.
//

import SwiftUI
import FirebaseCore

@main
struct TodoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
