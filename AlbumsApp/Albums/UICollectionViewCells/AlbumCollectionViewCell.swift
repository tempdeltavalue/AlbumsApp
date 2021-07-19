//
//  AlbumCollectionViewCell.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 16.07.2021.
//

import UIKit

final class AlbumCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlbumCollectionViewCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.backgroundColor = .white
        label.preferredMaxLayoutWidth = 80 //UIScreen.main.bounds.width - 20
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.backgroundColor = .red
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
//            widthAnchor.constraint(greaterThanOrEqualToConstant: 50),

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
