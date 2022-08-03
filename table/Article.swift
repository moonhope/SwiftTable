//
//  Artcle.swift
//  study_ios
//
//  Created by 武内 on 2022/06/29.
//

import Foundation

struct Article: Codable {
    let title: String
    let user: User
}

struct User: Codable {
    let id: String
}

