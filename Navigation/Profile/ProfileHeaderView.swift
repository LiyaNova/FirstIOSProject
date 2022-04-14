//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юлия Филимонова on 10.04.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        createViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.backgroundColor = .clear
        photoImageView.image = UIImage(named: "IMG_7007")
        photoImageView.layer.cornerRadius = 60
        photoImageView.clipsToBounds = true
        photoImageView.layer.borderWidth = 3
        photoImageView.layer.borderColor = UIColor.white.cgColor
        return photoImageView
    }()

    let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Yuliya Nova"
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userNameLabel.textAlignment = .center
        return userNameLabel
    }()

    let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Waiting for someting..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .center
        return statusLabel
    }()

    let statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = .systemBlue
        statusButton.tintColor = .white
        statusButton.layer.cornerRadius = 4
        statusButton.setTitle("Set status", for: .normal)
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return statusButton
    }()

    @objc private func buttonPressed() {
        if let text = statusText {
            statusLabel.text = text
            statusTextField.text?.removeAll()
        }
    }

    let statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.placeholder = "Waiting for something..."
        statusTextField.textAlignment = .center
        statusTextField.clearButtonMode = .always
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_ :)),
                                  for: .editingChanged)
        return statusTextField
    }()

    @objc private func statusTextChanged(_ textField: UITextField) {
            statusText = textField.text
    }

    func createViews() {
        [photoImageView, userNameLabel, statusLabel,
         statusButton, statusTextField].forEach {addSubview($0)}

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            photoImageView.widthAnchor.constraint(equalToConstant: 120),
            photoImageView.heightAnchor.constraint(equalToConstant: 120)
        ])

        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -54),
            statusLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
           statusButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16),
           statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
           statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
           statusButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            statusTextField.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor,
                                                     constant: 20)
        ])
    }
    
}
