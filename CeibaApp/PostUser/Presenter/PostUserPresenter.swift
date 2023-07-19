//
//  PostUserPresenter.swift
//  CeibaApp
//
//  Created by yesid mendoza on 19/07/23.
//

import UIKit

/// PostUserPresenter Module Presenter
class PostUserPresenter {
    
    weak var view: PostUserViewProtocol?
    private var interactor: PostUserInteractorProtocol
    
    init(PostUserInteractor: PostUserInteractor) {
        self.interactor = PostUserInteractor
    }
    
    func getPostById (id:Int){
        interactor.getPostById(postId: id, completion: { [weak self] (post) in
            guard let _ = self else {
                return
            }
            self?.view?.setItemsTableviewPost(post: post)
        })
    }
}

