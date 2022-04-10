//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юлия Филимонова on 10.04.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    

    let headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        headerView.backgroundColor = .systemGray5
        return headerView
    }()

    let photoImageView: UIImageView = {
        let photoImageView = UIImageView(frame: CGRect(x: 16, y: 119, width: 120, height: 120))
        photoImageView.backgroundColor = .clear
        photoImageView.image = UIImage(named: "IMG_7007")
        photoImageView.layer.cornerRadius = photoImageView.bounds.width/2
        photoImageView.clipsToBounds = true
        photoImageView.layer.borderWidth = 3
        photoImageView.layer.borderColor = UIColor.white.cgColor
        return photoImageView
    }()

    let userNameLabel: UILabel = {
        let userNameLabel = UILabel(frame: CGRect(x: 0, y: 127, width: UIScreen.main.bounds.width, height: 22))
        userNameLabel.text = "Yuliya Nova"
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userNameLabel.textAlignment = .center
        return userNameLabel
    }()

    let statusLabel: UILabel = {
        let statusLabel = UILabel(frame: CGRect(x: 20, y: 203, width: UIScreen.main.bounds.width, height: 18))
        statusLabel.text = "Waiting for someting..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .center
        return statusLabel
    }()

    let statusButton: UIButton = {
        let statusButton = UIButton(frame: CGRect(x: 16, y: 255, width: UIScreen.main.bounds.width - 34, height: 50))
        statusButton.backgroundColor = .systemBlue
        statusButton.tintColor = .white
        statusButton.layer.cornerRadius = 4
        statusButton.setTitle("Show status", for: .normal)
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return statusButton
    }()

    @objc private func buttonPressed() {
        print("Waiting for someting...")
    }

    func createViews() {
        addSubview(headerView)
        addSubview(photoImageView)
        addSubview(userNameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
    }
}
