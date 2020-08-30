//
//  FriendRequest.swift
//  Messages UI
//
//  Created by Anthony on 7/24/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation

struct FriendRequest: Codable {
    var id: String
    var userFrom: String
    var userTo: String
    var didAccept: Bool
    var didReject: Bool
    var didIgnore: Bool
    var createdAt: String
    var updatedAt: String
}
