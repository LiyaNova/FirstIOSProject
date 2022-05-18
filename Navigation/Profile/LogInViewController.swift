//
//  LogInViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 17.04.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {

    private var email: String?
    private var password: String?
    private var emailStandard = "12345"
    private var passwordStandard = "12345a!"
    private let nc = NotificationCenter.default

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()

    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo")
        return logoImageView
    }()

    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = .systemGray6
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
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
        if password!.count > 0, password!.count < 7  {
            warningLabel.isHidden = false
        } else if password!.count >= 7 && !password!.isValidEmail{
            warningLabel.isHidden = false
            warningLabel.text = "Your password needs small letters, number and symbols !?@#"
        } else if password!.count >= 7 && password!.isValidEmail && password != passwordStandard {
            warningLabel.isHidden = false
            warningLabel.text = "Password is valid"
        } else {
           warningLabel.isHidden = true
      }
    }

    private func animatePlaceHolder(_ textField: UITextField) {
        let placeHolderLabel = textField.subviews.first(where: { NSStringFromClass(type(of: $0)) == "UITextFieldLabel" })
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) {
            placeHolderLabel!.center.x += 10
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) {
                placeHolderLabel!.center.x -= 10
            }
        }
    }

    private func alertLogIn() {
        let alert = UIAlertController(title: "Oops!", message: "You used the wrong username or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Try again", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }

    private var warningLabel: UILabel = {
        let warningLabel = UILabel()
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.backgroundColor = .white
        warningLabel.text = "Your password should be longer than 6 symbols"
        warningLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        warningLabel.textColor = .red
        warningLabel.isHidden = true
        return warningLabel
    }()

    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log in", for: .normal)
        logInButton.tintColor = .white
        let imageActiveState = UIImage(named: "blue_pixel")!.setAlpha(1.0)
        let imageOtherState = UIImage(named: "blue_pixel")!.setAlpha(0.8)
        logInButton.setBackgroundImage(imageActiveState, for: .normal)
        logInButton.setBackgroundImage(imageOtherState, for: .selected)
        logInButton.setBackgroundImage(imageOtherState, for: .highlighted)
        logInButton.setBackgroundImage(imageOtherState, for: .disabled)
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true
        logInButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return logInButton
    }()

    @objc private func tapAction() {
        if (email == nil || email?.count == 0) && (password == nil || password?.count == 0) {
            animatePlaceHolder(emailTextField)
            animatePlaceHolder(passwordTextField)
        } else if (email == nil || email?.count == 0) && password != nil {
            animatePlaceHolder(emailTextField)
            warningLabel.isHidden = true
        } else if (password == nil || password?.count == 0) && email != nil {
            animatePlaceHolder(passwordTextField)
        } else if email != nil, email != emailStandard && password != nil, password != passwordStandard {
            alertLogIn()
            warningLabel.isHidden = true
        } else if (email == emailStandard && password != passwordStandard) || (password == passwordStandard && email != emailStandard) {
            alertLogIn()
            warningLabel.isHidden = true
        } else if email == emailStandard && password == passwordStandard {
            let vc = ProfileViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        addView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0,
                                                                    bottom: kbdSize.height, right: 0)
        }
    }

    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    private func addView() {
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])

        [logoImageView, emailTextField, passwordTextField, warningLabel, logInButton].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                               constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),

            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                     constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                       constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                        constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            warningLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            warningLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: -16),
            warningLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: 16),
            warningLabel.bottomAnchor.constraint(equalTo: logInButton.topAnchor),

            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16)
        ])
    }

}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
}

