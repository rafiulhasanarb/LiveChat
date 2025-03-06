//
//  ContentView.swift
//  LiveChat
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var messageVM = MessageViewModel()
    
    var body: some View {
        VStack {
            TitleRowView()
            
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(messageVM.messages, id: \.id) { message in
                        MessageBubbleView(message: message)
                    }
                }
                .padding(.top, 10)
                .background(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .onChange(of: messageVM.lastMessageId) { id, _ in
                    withAnimation {
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                }
            }
        }
        .background(Color.peach)
        
        MessageFieldView()
            .environmentObject(messageVM)
    }
}

#Preview {
    ContentView()
}
