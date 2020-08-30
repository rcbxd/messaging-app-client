//
//  UserRestrictions.swift
//  Messages UI
//
//  Created by Anthony on 7/24/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation

struct UserRestrictions: Codable {
    var id: String
    var restrictedUserID: String
    var userID: String
    var isMuted: Bool
    var isBlocked: Bool
    var canCall: Bool
    var canSendMedia: Bool
    var createdAt: String
    var updatedAt: String
}
