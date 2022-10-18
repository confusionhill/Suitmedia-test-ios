//
//  UserState.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import ReSwift

enum UserAction: Action {
    case add(user: UserModel)
}

struct UserState {
    var user: UserModel?
}

func userReducer(action: Action, state: UserState?) -> UserState {
    var state = state ?? UserState()
    let action = action as! UserAction
    switch action {
    case .add(let user):
        state.user = user
    }
    return state
}
