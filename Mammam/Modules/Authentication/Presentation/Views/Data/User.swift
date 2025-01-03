//
//  User.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.
//

import Foundation
import SwiftData

@Model
class User {
    @Attribute(.unique) var userId: String
    var email: String
    var firstName: String
    var lastName: String
    
    var baby : Baby?
    
    init(userId: String, email: String, firstName: String, lastName: String, baby: Baby? = nil) {
        self.userId = userId
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.baby = baby
    }
}



