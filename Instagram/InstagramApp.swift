//
//  InstagramApp.swift
//  Instagram
//
//  Created by Pablo Junior Almonte Avila on 6/5/22.
//

import SwiftUI

@main
struct InstagramApp: App {
    var body: some Scene {
        WindowGroup {
            FeedView(users: User.sampleData, posts: Post.sampleData)
        }
    }
}
