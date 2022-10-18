//
//  UserStore.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import ReSwift

let userStore = Store<UserState>(
    reducer: userReducer, state: .init(user: nil)
)
