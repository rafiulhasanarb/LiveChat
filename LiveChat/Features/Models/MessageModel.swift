//
//  MessageModel.swift
//  LiveChat
//
//  Created by Rafiul Hasan on 3/7/25.
//

import Foundation

struct MessageModel: Codable, Identifiable {
    var id: String
    var text: String
    var received: Bool
    var createdAt: Date
}
