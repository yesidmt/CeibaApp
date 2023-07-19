//
//  PostUserContract.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//

import UIKit

protocol PostUserViewProtocol: AnyObject {
    // Update UI with value returned.
    /// Set the view Object of Type ListUserEntity
    func setItemsTableviewPost(post:[PostUserData])
}

//MARK: Interactor -
///  Module Interactor Protocol
protocol PostUserInteractorProtocol {
   func getPostById(postId: Int,completion: @escaping ((_ postUserData: [PostUserData]) -> Void))
}
