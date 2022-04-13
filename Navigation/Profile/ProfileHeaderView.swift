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
        createViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let photoImageView: UIImageView = {
        let photoImageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 120, height: 120))
        photoImageView.backgroundColor = .clear
        photoImageView.image = UIImage(named: "IMG_7007")
        photoImageView.layer.cornerRadius = photoImageView.bounds.width/2
        photoImageView.clipsToBounds = true
        photoImageView.layer.borderWidth = 3
        photoImageView.layer.borderColor = UIColor.white.cgColor
        return photoImageView
    }()

    let userNameLabel: UILabel = {
        let userNameLabel = UILabel(frame: CGRect(x: 0, y: 27, width: UIScreen.main.bounds.width, height: 22))
        userNameLabel.text = "Yuliya Nova"
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userNameLabel.textAlignment = .center
        return userNameLabel
    }()

    let statusLabel: UILabel = {
        let statusLabel = UILabel(frame: CGRect(x: 20, y: 70, width: UIScreen.main.bounds.width, height: 18))
        statusLabel.text = "Waiting for someting..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .center
        return statusLabel
    }()

    let statusButton: UIButton = {
        let statusButton = UIButton(frame: CGRect(x: 16, y: 152, width: UIScreen.main.bounds.width - 34, height: 50))
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
        let statusTextField = UITextField(frame: CGRect(x: 140, y: 100, width: 250, height: 40))
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
        addSubview(photoImageView)
        addSubview(userNameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusTextField)
    }
}
