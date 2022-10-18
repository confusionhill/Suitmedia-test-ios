//
//  ThirdViewModel.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import Foundation

protocol ThirdViewModelInput {
    var viewOutput: ThirdViewModelOutput? { get set }
    func viewDidLoad()
    var users: [UserModel] { get }
    func isPaginable(idxPath: IndexPath) -> Bool
    func getUsers()
    func refreshUsers()
    var currPage: Int { get }
}

protocol ThirdViewModelOutput: AnyObject {
    func setupView()
    func doneGettingUsers()
    func failGettingUsers()
}

final class ThirdViewModel: ThirdViewModelInput {
    weak var viewOutput: ThirdViewModelOutput?
    var service: UserServiceInput = UserService()
    var lastPage: Int = 1
    private(set) var currPage: Int = 1
    var isLastPage: Bool {
        return currPage > lastPage
    }
    private(set) var users: [UserModel] = []
    
    func viewDidLoad() {
        service.delegate = self
        viewOutput?.setupView()
        service.getUsers(page: 1)
    }
    
    func isPaginable(idxPath: IndexPath) -> Bool {
        let isRowLast = idxPath.row+1 == users.count
        return !isLastPage && isRowLast
    }
    
    func refreshUsers() {
        self.users = []
        self.currPage = 1
        self.service.getUsers(page: 1)
    }
    func getUsers() {
        service.getUsers(page: self.currPage)
    }
    
}

extension ThirdViewModel: UserServiceOutput {
    func didFinnishGetUser(detail: RootModel, result: [UserModel?]) {
        result.forEach { model in
            if let model = model {
                self.users.append(model)
            }
        }
        self.currPage += 1
        self.lastPage = detail.totalPages
        viewOutput?.doneGettingUsers()
    }
    
    func didFailGetUser(msg: String) {
        viewOutput?.failGettingUsers()
    }
    
    
}
