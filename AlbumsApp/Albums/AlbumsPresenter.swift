//
//  Presenter.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 17.07.2021.
//

import Foundation

final class AlbumsPresenter {
    var apiClient = APIClient()
    
    private(set) var albums: [Album]?

    private(set) weak var albumsView: AlbumsView?
    
    init(albumsView: AlbumsView) {
        self.albumsView = albumsView
        
        self.albumsView?.cellDidSelect = { [weak self] index in
            if let albumsId = self?.albums?[index] {
                self?.apiClient.getPhotos(for: albumsId.id) { photos, error in
                    DispatchQueue.main.async {
                        self?.handleGetPhotosResponse(photos: photos, error: error)
                    }
                }
            }
        }
    }

    func getAlbums() {
        apiClient.getAlbums() { [weak self] albums, error in
            if let _ = error {
                
            } else {
                DispatchQueue.main.async {
                    self?.albums = albums
                    self?.albumsView?.albumsCollectionView.reloadData()
                }
            }
        }
    }
    
    func handleGetPhotosResponse(photos: [Photo]?, error: Error?) {
        if let photos = photos {
            pushPhotosView(photos: photos)
        } else if let _ = error {
            // showError

        } else {
            // showEmptyPhotosError
        }
    }
    
    func pushPhotosView(photos: [Photo]) {
        let albumPhotosView = AlbumPhotosView()
        let photoView = PhotoView()
        let albumPhotoPresenter = AlbumPhotosPresenter(photos: photos,
                                                       view: albumPhotosView,
                                                       photoView: photoView)
        
        albumPhotosView.presenter = albumPhotoPresenter
        
        
        // Router
        albumsView?.navigationController?.pushViewController(albumPhotosView, animated: true)
    }
}
