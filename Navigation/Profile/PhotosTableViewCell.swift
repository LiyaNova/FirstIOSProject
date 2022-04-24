//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Юлия Филимонова on 24.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

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
        //photoOneImageView.image = UIImage(systemName: "arrow.right")
        return photoOneImageView
    }()

    private let photoOneImageView: UIImageView = {
        let photoOneImageView = UIImageView()
        photoOneImageView.translatesAutoresizingMaskIntoConstraints = false
        //photoOneImageView.contentMode = .scaleAspectFit
        //photoOneImageView.image = UIImage(named: "jey")
        photoOneImageView.layer.cornerRadius = 6
        photoOneImageView.clipsToBounds = true
        return photoOneImageView
    }()

    private let photoTwoImageView: UIImageView = {
        let photoTwoImageView = UIImageView()
        photoTwoImageView.translatesAutoresizingMaskIntoConstraints = false
       // photoTwoImageView.contentMode = .scaleAspectFit
        //photoTwoImageView.image = UIImage(named: "jm")
        photoTwoImageView.layer.cornerRadius = 6
        photoTwoImageView.clipsToBounds = true
        return photoTwoImageView
    }()

    private let photoThreeImageView: UIImageView = {
        let photoThreeImageView = UIImageView()
        photoThreeImageView.translatesAutoresizingMaskIntoConstraints = false
       // photoThreeImageView.contentMode = .scaleAspectFit
       // photoThreeImageView.image = UIImage(named: "rp")
        photoThreeImageView.layer.cornerRadius = 6
        photoThreeImageView.clipsToBounds = true
        return photoThreeImageView
    }()

    private let photoFourImageView: UIImageView = {
        let photoFourImageView = UIImageView()
        photoFourImageView.translatesAutoresizingMaskIntoConstraints = false
        //photoFourImageView.contentMode = .scaleAspectFit
        //photoFourImageView.image = UIImage(named: "fm")
        photoFourImageView.layer.cornerRadius = 6
        photoFourImageView.clipsToBounds = true
        return photoFourImageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [backView, photosLabel, arrowImageView, photoOneImageView, photoTwoImageView, photoThreeImageView, photoFourImageView].forEach { contentView.addSubview($0) }

        //let photoSize = (UIScreen.main.bounds.width - PhotosTableViewCell().bounds.width

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12)
        ])

        NSLayoutConstraint.activate([
            arrowImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 12),
            arrowImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor,
                                                     constant: -12),
            //arrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            photoOneImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photoOneImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            photoOneImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),
            photoOneImageView.widthAnchor.constraint(equalToConstant: 100),
            photoOneImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            photoTwoImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photoTwoImageView.leadingAnchor.constraint(equalTo: photoOneImageView.trailingAnchor, constant: 8),
            photoTwoImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),
            photoTwoImageView.widthAnchor.constraint(equalToConstant: 100),
            photoTwoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            photoThreeImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor,
                                                     constant: 12),
            photoThreeImageView.leadingAnchor.constraint(equalTo:  photoTwoImageView.trailingAnchor,
                                                         constant: 8),
            photoThreeImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor,
                                                        constant: -12),
            photoThreeImageView.widthAnchor.constraint(equalToConstant: 100),
            photoThreeImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            photoFourImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photoFourImageView.leadingAnchor.constraint(equalTo: photoThreeImageView.trailingAnchor, constant: 8),
            photoFourImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            photoFourImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),
            photoFourImageView.widthAnchor.constraint(equalToConstant: 100),
            photoFourImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
