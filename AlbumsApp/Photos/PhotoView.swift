//
//  PhotoView.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 17.07.2021.
//

import UIKit
import Kingfisher

final class PhotoView: UIViewController {
    weak var presenter: AlbumPhotosPresenter?
    
    lazy var photosCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width,
                                     height: UIScreen.main.bounds.height-80)
        //        flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .green
        
//        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        
        collectionView.register(LargePhotoCollectionViewCell.self, forCellWithReuseIdentifier: LargePhotoCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Photo", comment: "")

        view.addSubview(photosCollectionView)
        
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            photosCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photosCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
        photosCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        photosCollectionView.selectItem(at: IndexPath(row: presenter?.currentSelectedIndex ?? 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
    }
}

extension PhotoView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter?.dataSource.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargePhotoCollectionViewCell.identifier, for: indexPath) as? LargePhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.urlStr = presenter?.dataSource[indexPath.row].url
        
        return cell
    }
}


