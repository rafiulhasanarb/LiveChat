//
//  MessageViewModel.swift
//  LiveChat
//
//  Created by Rafiul Hasan on 3/7/25.
//

import Foundation
import FirebaseFirestore

final class MessageViewModel: ObservableObject {
    @Published private(set) var messages: [MessageModel] = []
    @Published private(set) var lastMessageId = ""
    
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            
            self.messages = documents.compactMap { document -> MessageModel? in
                do {
                    return try document.data(as: MessageModel.self)
                } catch {
                    print(error.localizedDescription)
                    return nil
                }
            }
            
            self.messages.sort { $0.createdAt < $1.createdAt }
            
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(_ text: String) {
        do {
            let newMessage = MessageModel(id: "\(UUID())", text: text, received: false, createdAt: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print(error.localizedDescription)
        }
    }
}
