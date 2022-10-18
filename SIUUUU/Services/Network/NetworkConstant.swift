//
//  NetworkConstant.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import Foundation

// https://reqres.in/api/users?page=2
enum NetworkConstant {
    enum httpMethod: String {
        case get = "GET"
        case post = "POST"
        // dst
    }
    
    case user(page: Int)
    private var root: String {"https://reqres.in/api"}
    public var url: URL {
        switch self {
        case .user:
            let url = URL(string: "\(self.root)\(self.path)")!
            return url
        }
    }
    private var method: httpMethod {
        switch self {
        case .user:
            return .get
        }
    }
    public var request: URLRequest {
        var req = URLRequest(url: self.url)
        req.httpMethod = self.method.rawValue
        return req
    }
    
    public var path: String {
        switch self {
        case .user(let page):
            return "/users?page=\(page)"
        }
    }
}
