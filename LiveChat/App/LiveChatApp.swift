//
//  LiveChatApp.swift
//  LiveChat
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI
import Firebase

@main
struct LiveChatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
