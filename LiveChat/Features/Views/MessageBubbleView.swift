//
//  MessageBubbleView.swift
//  LiveChat
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct MessageBubbleView: View {
    
    var message: MessageModel
    @State var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color.customGray : Color.peach)
                    .cornerRadius(20)
            }
            .frame(maxWidth: 300, alignment: message.received ?  .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text(message.createdAt.formatted(.dateTime.hour().minute().second()))
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubbleView(message: MessageModel(id: "12345", text: "hi there, i am here to help", received: false, createdAt: Date()))
}
