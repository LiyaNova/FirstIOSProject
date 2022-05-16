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
    
    private var leadingPhotoView = NSLayoutConstraint()
    private var topPhotoView = NSLayoutConstraint()
    private var widthPhotoView = NSLayoutConstraint()
    private var heightPhotoView = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.isUserInteractionEnabled = true
        let tapPhotoGesture = UITapGestureRecognizer(target: self, action: #selector(tapPhotoAction))
        photoImageView.addGestureRecognizer(tapPhotoGesture)
        photoImageView.backgroundColor = .clear
        photoImageView.image = UIImage(named: "IMG_7007")
        photoImageView.layer.cornerRadius = 60
        photoImageView.clipsToBounds = true
        photoImageView.layer.borderWidth = 3
        photoImageView.layer.borderColor = UIColor.white.cgColor
        return photoImageView
    }()
    
    @objc private func tapPhotoAction() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.widthPhotoView.constant = UIScreen.main.bounds.width
                self.heightPhotoView.constant = UIScreen.main.bounds.width
                self.topPhotoView.constant = UIScreen.main.bounds.height/6
                self.leadingPhotoView.constant = 0
                self.layoutIfNeeded()
                
                self.photoImageView.layer.cornerRadius = 0
                self.photoImageView.layer.borderWidth = 0
                self.screenView.alpha = 0.7
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
                self.crossImageView.alpha = 1.0
            }
            
        }
    }
    
    private let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Yuliya Nova"
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userNameLabel.textAlignment = .center
        return userNameLabel
    }()
    
    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .left
        return statusLabel
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.placeholder = "Set your status..."
        statusTextField.textAlignment = .center
        statusTextField.clearButtonMode = .always
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_ :)),
                                  for: .editingChanged)
        return statusTextField
    }()
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
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
            statusTextField.isHidden = true
            statusButton.setTitle("Change status", for: .normal)
        } else {
            statusTextField.placeholder = "Please, wright something"
        }
    }
    
    private let screenView: UIView = {
        let screenView = UIView()
        screenView.translatesAutoresizingMaskIntoConstraints = false
        screenView.backgroundColor = .black
        screenView.alpha = 0.0
        return screenView
    }()
    
    private lazy var crossImageView: UIImageView = {
        let crossImageView = UIImageView()
        crossImageView.translatesAutoresizingMaskIntoConstraints = false
        let tapCrossGesture = UITapGestureRecognizer(target: self, action: #selector(tapCrossAction))
        crossImageView.addGestureRecognizer(tapCrossGesture)
        crossImageView.isUserInteractionEnabled = true
        crossImageView.image = UIImage(systemName: "multiply")
        crossImageView.tintColor = .white
        crossImageView.alpha = 0.0
        return crossImageView
    }()
    
    @objc private func tapCrossAction() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                self.crossImageView.alpha = 0.0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.5) {
                self.widthPhotoView.constant = 120
                self.heightPhotoView.constant = 120
                self.topPhotoView.constant = 16
                self.leadingPhotoView.constant = 16
                self.layoutIfNeeded()
                
                self.photoImageView.layer.cornerRadius = 60
                self.photoImageView.layer.borderWidth = 3
                self.screenView.alpha = 0.0
            }
        }
        
    }

    private func createViews() {
        [ userNameLabel, statusLabel, statusTextField, statusButton, screenView, photoImageView, crossImageView ].forEach {addSubview($0)}
        
        topPhotoView = photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        leadingPhotoView = photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        heightPhotoView = photoImageView.heightAnchor.constraint(equalToConstant: 120)
        widthPhotoView = photoImageView.widthAnchor.constraint(equalToConstant: 120)
        
        NSLayoutConstraint.activate([
            topPhotoView, leadingPhotoView, heightPhotoView, widthPhotoView,
            
            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 146),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -54),
            
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            statusTextField.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                     constant: 136),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            screenView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            screenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            crossImageView.bottomAnchor.constraint(equalTo: photoImageView.topAnchor),
            crossImageView.trailingAnchor.constraint(equalTo: screenView.trailingAnchor)
        ])
        
       // screenView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    }
    
}
