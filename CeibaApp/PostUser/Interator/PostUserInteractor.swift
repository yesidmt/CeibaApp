//
//  PostUserInteractor.swift
//  CeibaApp
//
//  Created by yesid mendoza on 19/07/23.
//

import Foundation

/// PostUserInteractor Module Interactor
class PostUserInteractor: PostUserInteractorProtocol {
    func getPostById(postId: Int, completion: @escaping (([PostUserData]) -> Void)) {
        let link = Endpoint.baseURL + "\(Endpoint.postByIdUser(id: postId).path)"
        guard let url = URL(string: link) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let dataResult = data else { return }
            do {
                let postUserData = try JSONDecoder().decode([PostUserData].self, from: dataResult)
                completion(postUserData)
            } catch {
                print(error)
            }
        }).resume()
    }
}
