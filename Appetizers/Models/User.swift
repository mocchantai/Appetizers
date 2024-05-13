//
//  User.swift
//  Appetizers
//
//  Created by motomura on 2024/05/12.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
