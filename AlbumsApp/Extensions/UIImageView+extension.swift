//
//  UIImageView+extension.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 17.07.2021.
//

import UIKit

import Kingfisher

extension UIImageView {
    func load(url: URL,
              placeholder: UIImage?,
              cache: URLCache? = nil) {
        KF.url(url)
            .fade(duration: 1)
            .loadDiskFileSynchronously()
            .set(to: (self))
    }
}
