//
//  Photo.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 18.07.2021.
//

import Foundation

struct Photo: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
