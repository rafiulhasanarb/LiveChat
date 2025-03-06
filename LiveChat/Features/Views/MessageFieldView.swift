//
//  MessageFieldView.swift
//  LiveChat
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct MessageFieldView: View {
    
    @State var message: String = ""
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Type your message..."), text: $message)
            
            Button {
                print("message send")
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.peach)
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.customGray)
        .cornerRadius(50)
        .padding()
    }
}

#Preview {
    MessageFieldView()
}
