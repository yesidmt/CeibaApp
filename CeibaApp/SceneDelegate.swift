//
//  SceneDelegate.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var factoryApp = FactoryApp()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        factoryApp.createAppInit(windows: window!)
    }
}


