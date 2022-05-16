//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Юлия Филимонова on 29.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    private lazy var photoImage: UIImageView = {
        let photoImage = UIImageView()
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        photoImage.contentMode = .scaleAspectFill
        photoImage.clipsToBounds = true
        return photoImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ photoGallery: PhotoGallery) {
        photoImage.image = photoGallery.photo
    }
    
    private func addView(){
        contentView.addSubview(photoImage)
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
