//
//  Contact.swift
//  Messages UI
//
//  Created by Anthony on 7/24/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation

struct Contact: Codable {
    var id: String
    var userOneId: String
    var userTwoId: String
    var userOneName: String
    var userTwoName: String
    var createdAt: String
    var updatedAt: String
}
