//
//  ListUserPresenter.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//

import UIKit

/// ListUserPresenter Module Presenter
class ListUserPresenter {
    
    weak var view: listUserViewProtocol?
    private var interactor: ListUserInteractorProtocol
    var router: ListUserRouter
    
    init(ListUserInteractor: ListUserInteractor, router: ListUserRouter) {
        self.interactor = ListUserInteractor
        self.router = router
    }

    func goToPostUser(user: User) {
        router.goToPostUser(user: user)
    }
    func getAllUsers() {
        interactor.getAllUsers(completion: { [weak self] (users) in
            guard let _ = self else {
                return
            }
            self?.view?.setItemsTableviewUsers(users: users)
       
        })
    }
}
