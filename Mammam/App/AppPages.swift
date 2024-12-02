//
//  AppPages.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 15/10/24.
//

import Foundation

enum AppPages: Hashable {
    case main
    case login
}

enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case forgotPassword
    case rateMeal
}

enum FullSceenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case signUp 
}
