//
//  SceneDelegate.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 16.07.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            //Router 
            let window = UIWindow(windowScene: windowScene)
            
            let albumsView = AlbumsView()
            let albumsPresenter = AlbumsPresenter(albumsView: albumsView)
            albumsView.presenter = albumsPresenter
            
            let navigationController = UINavigationController(rootViewController: albumsView)
            window.rootViewController = navigationController
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

