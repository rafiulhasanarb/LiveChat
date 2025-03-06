//
//  ContentView.swift
//  LiveChat
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TitleRowView()
            
            ScrollView {
                ForEach(0..<20) { _ in
                    MessageBubbleView(message: MessageModel(id: "123654", text: "Hello there i am here to test and help your business", received: false, createdAt: Date()))
                }
            }
            .padding(.top, 10)
            .background(Color.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
        }
        .background(Color.peach)
    }
}

#Preview {
    ContentView()
}
