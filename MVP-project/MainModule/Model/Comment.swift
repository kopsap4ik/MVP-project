//
//  Comment.swift
//  MVP-project
//
//  Created by Василий Петухов on 06.01.2021.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
