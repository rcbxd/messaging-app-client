//
//  Message.swift
//  Messages UI
//
//  Created by Anthony on 7/24/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation

struct Message: Codable {
    var id: String
    var fromId: String
    var text: String
    var isRead: Bool
    var chatId: String
    var isGroupChat: Bool
    var createdAt: String
    var updatedAt: String
}
