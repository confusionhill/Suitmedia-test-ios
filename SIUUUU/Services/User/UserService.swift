//
//  UserService.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import Foundation

protocol UserServiceInput {
    func getUsers(page: Int)
    var delegate: UserServiceOutput? { get set }
}
protocol UserServiceOutput: AnyObject {
    func didFinnishGetUser(
        detail: RootModel,
        result: [UserModel?]
    )
    func didFailGetUser(msg: String)
}

final class UserService: UserServiceInput {
    let network = NetworkService()
    weak var delegate: UserServiceOutput?
    
    public func getUsers(page: Int = 1) {
        network.request(constant: .user(page: page)) { fin in
            switch fin {
            case .success(let data):
                let detail = RootModel(json: data) ?? RootModel()
                let result = data["data"].arrayValue.map { child in
                    return UserModel(json: child)
                }.filter { model in
                        return model != nil
                    }
                self.delegate?.didFinnishGetUser(
                    detail: detail,
                    result: result)
            case .failure(let fail):
                self.delegate?.didFailGetUser(msg: fail.localizedDescription)
            }
        }
    }
}
