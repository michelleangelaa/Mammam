//
//  User.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 03/10/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
}

//test
