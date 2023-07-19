//
//  ListUserContracts.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//

import UIKit

protocol listUserViewProtocol: AnyObject {
    // Update UI with value returned.
    /// Set the view Object of Type ListUserEntity
    func setItemsTableviewUsers(users:Users)
}

//MARK: Interactor -
///  Module Interactor Protocol
protocol ListUserInteractorProtocol {
   func getAllUsers(completion: @escaping ((_ users: Users) -> Void))
}
//MARK: Router (aka: Wireframe) -
///  Module Router Protocol
protocol ListUserRouterProtocol {
    func goToPostUser (user: User)
}
