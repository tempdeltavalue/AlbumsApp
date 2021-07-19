//
//  String+extension.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 18.07.2021.
//

import Foundation

extension String {
    var url: URL? {
        return URL(string: self)
    }
}
