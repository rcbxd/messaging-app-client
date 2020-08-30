//
//  Chat.swift
//  Messages UI
//
//  Created by Anthony on 7/24/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation

struct ChatModel: Codable {
    var id: String
    var userOne: String
    var userTwo: String
    var isDeleted: Bool
}
