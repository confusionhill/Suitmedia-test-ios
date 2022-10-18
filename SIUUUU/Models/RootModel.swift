//
//  RootModel.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import Foundation
import SwiftyJSON

struct RootModel: Codable {
    let page, perPage, total, totalPages: Int
    
    init() {
        self.page = 1
        self.perPage = 1
        self.total = 1
        self.totalPages = 1
    }
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        self.page = json["page"].int ?? 0
        self.perPage = json["per_page"].int ?? 0
        self.total = json["total"].int ?? 0
        self.totalPages = json["total_pages"].int ?? 0
    }
}
