//
//  Util.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//

import Foundation
import UIKit

class Util {
    static let sharedInstance = Util()
    private init() { }

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}


extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

enum Endpoint {
    case users
    case posts
    case postByIdUser(id: Int)
    static let baseURL = "https://jsonplaceholder.typicode.com"
       
    var path: String {
        switch self {
        case .users:
            return "/users”"
        case .posts:
            return "/posts"
        case .postByIdUser(let id):
            return "/posts?userId=\(id)"
        }
    }
    func url() -> URL? {
            return URL(string: Endpoint.baseURL + path)
    }
}
