//
//  LargePhotoCollectionViewCell.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 17.07.2021.
//

import UIKit

final class LargePhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "LargePhotoCollectionViewCell"

    var urlStr: String? {
        didSet {
            if let url = urlStr?.url {
                photoImageView.load(url: url, placeholder: UIImage(named: "placeholderImage"))
            }
        }
    }
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
