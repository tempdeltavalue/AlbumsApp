//
//  AlbumsView.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 16.07.2021.
//

import UIKit

final class AlbumsView: UIViewController {
    var presenter: AlbumsPresenter?
    
    var cellDidSelect: ((_ index: Int)->())?
    
    lazy var albumsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize//CGSize(width: 80, height: 40)
        flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: generateLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .green
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Albums", comment: "")
        
        view.addSubview(albumsCollectionView)
        
        NSLayoutConstraint.activate([
            albumsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            albumsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            albumsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            albumsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
        presenter?.getAlbums()
    }
}

extension AlbumsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath) as? AlbumCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.titleLabel.text = presenter?.albums?[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.albums?.count ?? 0
    }
}

extension AlbumsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellDidSelect?(indexPath.row)
    }
}

private extension AlbumsView {
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(0.25)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: groupHeight)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
        
        return layout
    }
}
