//
//  ListUserRouter.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//

import UIKit

///  Module Router (aka: Wireframe)
class ListUserRouter: ListUserRouterProtocol {
    let view : ListUsersView
    
    init(listUserView: ListUsersView) {
        self.view = listUserView
    }
    func goToPostUser (user: User) {
        let postUserView = PostUserView()
        let interactor = PostUserInteractor()
        let presenter = PostUserPresenter(PostUserInteractor: interactor)
        presenter.view = postUserView
        postUserView.presenter = presenter
       
        postUserView.user.append(user)
        view.present(postUserView, animated: true)
        
       
       
    }
}
