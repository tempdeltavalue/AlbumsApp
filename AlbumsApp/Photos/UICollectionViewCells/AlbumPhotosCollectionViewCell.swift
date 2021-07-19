//
//  AlbumPhotosCollectionViewCell.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 17.07.2021.
//

import UIKit

//https://github.com/onevcat/Kingfisher
import Kingfisher


final class AlbumPhotosCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlbumPhotosCollectionViewCell"
    
    var url: URL? {
        didSet {
            if let url = url {
                thumbnailImageView.load(url: url, placeholder: UIImage(named: "placeholderImage"))
            }
        }
    }
    lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false

        contentView.backgroundColor = .red
        
        contentView.addSubview(thumbnailImageView)

        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbnailImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            thumbnailImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
