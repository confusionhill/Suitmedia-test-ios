//
//  UserModel.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import Foundation
import SwiftyJSON

struct UserModel: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
    
    init() {
        self.id = 0
        self.email = ""
        self.firstName = ""
        self.lastName = ""
        self.avatar = ""
    }
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        self.id = json["id"].intValue
        self.email = json["email"].stringValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.avatar = json["avatar"].stringValue
    }
}
