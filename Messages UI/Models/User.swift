//
//  User.swift
//  Messages UI
//
//  Created by Anthony on 7/20/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var email: String
    var password: String
    var profilePictureURL: String
    var bio: String
    var isDeleted: Bool
    var username: String
    var seeRealName: Int
    var seeEmail: Int
    var textMe: Int
    var isOnline: Bool
    var lastSeen: String
    var addToGroupChats: Int
    var createdAt: String
    var updatedAt: String
}
