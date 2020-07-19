//
//  ChatPreview.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation

struct ChatPreview: Identifiable {
    var id: Int
    var chatID: String
    var name: String
    var date: String
    var fromYou: Bool
    var message: String
    var isOnline: Bool
    var profilePictureURL: String
    var isRead: Bool
}

var data = [
    ChatPreview(id: 0, chatID: "0", name: "Dev",date: "9:26 PM", fromYou: true, message: "Hey is it working?",  isOnline: true,   profilePictureURL: "https://avatars2.githubusercontent.com/u/50280805?s=400&u=77fc9891af8f385471ad0ffef8080f2e6a20550f&v=4", isRead: false),
    ChatPreview(id: 1, chatID: "0", name: "Alex",date: "1:25 PM", fromYou: false, message: "What's Up?",  isOnline: false,   profilePictureURL: "", isRead: false),
    ChatPreview(id: 2, chatID: "0", name: "Brian",date: "Fri", fromYou: false, message: "Hey",  isOnline: true,   profilePictureURL: "https://i1.sndcdn.com/artworks-000607192483-gl1bpq-t500x500.jpg", isRead: false),
    ChatPreview(id: 3, chatID: "0", name: "John Doe",date: "03/09/20", fromYou: true, message: "Yello",  isOnline: true, profilePictureURL: "https://i1.sndcdn.com/artworks-uJKsUhho1z3VBFVR-4fx9Zw-t500x500.jpg", isRead: true)
]

