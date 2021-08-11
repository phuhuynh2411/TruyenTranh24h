//
//  User.swift
//  Agile Board Team
//
//  Created by Huynh Tan Phu on 3/12/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import Foundation

struct User: Codable, Equatable {
    
    var id: String
    var firstName: String?
    var lastName: String?
    var name: String
    var email: String
    var createdAt: Date
    var updatedAt: Date
}
