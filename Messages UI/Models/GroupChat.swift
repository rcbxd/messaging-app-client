//
//  GroupChat.swift
//  Messages UI
//
//  Created by Anthony on 7/24/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation

struct GroupChat:Codable {
    var id: String
    var users: [String]
    var isDeleted: Bool
    var creator: String
    var name: String
    var admins: [String]
    var createdAt: String
    var updatedAt: String
}
