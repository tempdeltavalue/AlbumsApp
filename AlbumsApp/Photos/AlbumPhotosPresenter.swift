//
//  AlbumPhotosPresenter.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 17.07.2021.
//

import Foundation

final class AlbumPhotosPresenter {
    var apiclient = APIClient()
    var dataSource: [Photo]
    weak var view: AlbumPhotosView?
    
    var photoView: PhotoView

    private(set) var currentSelectedIndex: Int?
    
    init(photos: [Photo], view: AlbumPhotosView, photoView: PhotoView) {
        self.dataSource = photos
        self.view = view
        self.photoView = photoView
        
        self.photoView.presenter = self
        
        view.cellDidSelect = { [weak self] index in
            self?.currentSelectedIndex = index
            
            if let self = self {
                view.navigationController?.pushViewController(self.photoView, animated: true)
            }
        }
    }
}
