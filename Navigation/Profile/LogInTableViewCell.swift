//
//  LogInTableViewCell.swift
//  Navigation
//
//  Created by Юлия Филимонова on 17.04.2022.
//

import Foundation
import UIKit

class LogInTableViewCell: UITableViewCell {

    var email: String?
    var password: String?

    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = .systemGray6
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 0.5
        emailTextField.placeholder = "Email or phone"
        emailTextField.indent(size: 10)
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailTextField.autocapitalizationType = .none
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(getEmail(_ :)),
                                 for: .editingChanged)
        return emailTextField
    }()

    @objc private func getEmail(_ textField: UITextField) {
        email = textField.text
    }

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.placeholder = "Password"
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.indent(size: 10)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(getPassword(_ :)),
                                 for: .editingChanged)
        return passwordTextField
    }()

    @objc private func getPassword(_ textField: UITextField) {
        password = textField.text
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [emailTextField, passwordTextField].forEach( {contentView.addSubview($0)} )


        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])



    }

}

// MARK: - UITextFieldDelegate

extension LogInTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
}
