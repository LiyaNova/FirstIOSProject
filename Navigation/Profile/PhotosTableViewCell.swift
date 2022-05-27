//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Юлия Филимонова on 24.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        photosLabel.backgroundColor = .white
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.textColor = .black
        return photosLabel
    }()

    private let arrowImageView: UIImageView = {
        let photoOneImageView = UIImageView()
        photoOneImageView.translatesAutoresizingMaskIntoConstraints = false
        photoOneImageView.tintColor = .black
        return photoOneImageView
    }()

    private let photoOneImageView: UIImageView = {
        let photoOneImageView = UIImageView()
        photoOneImageView.translatesAutoresizingMaskIntoConstraints = false
        photoOneImageView.contentMode = .scaleAspectFill
        photoOneImageView.layer.cornerRadius = 6
        photoOneImageView.clipsToBounds = true
        return photoOneImageView
    }()

    private let photoTwoImageView: UIImageView = {
        let photoTwoImageView = UIImageView()
        photoTwoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoTwoImageView.contentMode = .scaleAspectFill
        photoTwoImageView.layer.cornerRadius = 6
        photoTwoImageView.clipsToBounds = true
        return photoTwoImageView
    }()

    private let photoThreeImageView: UIImageView = {
        let photoThreeImageView = UIImageView()
        photoThreeImageView.translatesAutoresizingMaskIntoConstraints = false
        photoThreeImageView.contentMode = .scaleAspectFill
        photoThreeImageView.layer.cornerRadius = 6
        photoThreeImageView.clipsToBounds = true
        return photoThreeImageView
    }()

    private let photoFourImageView: UIImageView = {
        let photoFourImageView = UIImageView()
        photoFourImageView.translatesAutoresizingMaskIntoConstraints = false
        photoFourImageView.contentMode = .scaleAspectFill
        photoFourImageView.layer.cornerRadius = 6
        photoFourImageView.clipsToBounds = true
        return photoFourImageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(_ photoLine: PhotoPost) {
        photosLabel.text = photoLine.name
        arrowImageView.image = photoLine.navigationImage
        photoOneImageView.image = photoLine.photoOne
        photoTwoImageView.image = photoLine.photoTwo
        photoThreeImageView.image = photoLine.photoThree
        photoFourImageView.image = photoLine.photoFour
    }


    private func layout() {
        
        [photosLabel, arrowImageView, photoOneImageView, photoTwoImageView, photoThreeImageView, photoFourImageView].forEach { contentView.addSubview($0) }

        let photoSize = (UIScreen.main.bounds.width - 48)/4

        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),

            photoOneImageView.topAnchor.constraint(equalTo:  photosLabel.bottomAnchor, constant: 12),
            photoOneImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoOneImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoOneImageView.heightAnchor.constraint(equalToConstant: photoSize),
            photoOneImageView.widthAnchor.constraint(equalToConstant: photoSize),

            photoTwoImageView.topAnchor.constraint(equalTo:  photosLabel.bottomAnchor, constant: 12),
            photoTwoImageView.leadingAnchor.constraint(equalTo: photoOneImageView.trailingAnchor, constant: 8),
            photoTwoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoTwoImageView.heightAnchor.constraint(equalToConstant: photoSize),
            photoTwoImageView.widthAnchor.constraint(equalToConstant: photoSize),

            photoThreeImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photoThreeImageView.leadingAnchor.constraint(equalTo: photoTwoImageView.trailingAnchor, constant: 8),
            photoThreeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoThreeImageView.heightAnchor.constraint(equalToConstant: photoSize),
            photoThreeImageView.widthAnchor.constraint(equalToConstant: photoSize),

            photoFourImageView.topAnchor.constraint(equalTo:  photosLabel.bottomAnchor, constant: 12),
            photoFourImageView.leadingAnchor.constraint(equalTo: photoThreeImageView.trailingAnchor, constant: 8),
            photoFourImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoFourImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoFourImageView.heightAnchor.constraint(equalToConstant: photoSize)
        ])
    }
    
}
