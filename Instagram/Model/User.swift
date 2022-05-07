//
//  User.swift
//  Instagram
//
//  Created by Pablo Junior Almonte Avila on 6/5/22.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    let id: UUID
    let name: String
    let image: String
    
    init(id: UUID = UUID(), name: String, image: String){
        self.id = id
        self.name = name
        self.image = image
    }
}

extension User {
    static var sampleData: [User] {
        return [
            User(name: "Maria", image: "profile1"),
            User(name: "Carlos", image: "profile2"),
            User(name: "Snoog Dog", image: "profile3"),
            User(name: "Michael", image: "profile4"),
            User(name: "Sofia", image: "profile5"),
            User(name: "Josh", image: "profile6"),
            User(name: "Al2", image: "profile7"),
            User(name: "Merry", image: "profile8"),
            User(name: "Julian", image: "profile9"),
            User(name: "Pablo", image: "profile10"),
        ]
    }
}
