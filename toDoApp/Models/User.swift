//
//  User.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//

import Foundation

struct User : Codable{
    let id: String
    let name:String
    let email: String
    let joined: TimeInterval
    
    func asDictionary() -> [String: Any] {
        return [
                "id": id,
                "name": name,
                "email": email,
                "joined": joined
        ]
    }
}
