//
//  LogInViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 17.04.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {

//    private let nc = NotificationCenter.default

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

    private lazy var logInTableView: UITableView = {
        let logInTableView = UITableView()
        logInTableView.translatesAutoresizingMaskIntoConstraints = false
        logInTableView.dataSource = self
        logInTableView.delegate = self
        logInTableView.layer.cornerRadius = 10
        logInTableView.layer.borderWidth = 0.5
        logInTableView.layer.borderColor = UIColor.lightGray.cgColor
        logInTableView.register(LogInTableViewCell.self, forCellReuseIdentifier: LogInTableViewCell.identifier)
        return logInTableView
    }()


    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.layer.cornerRadius = 10
        logInButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        logInButton.setTitle("Log in", for: .normal)
        logInButton.tintColor = .white
        logInButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return logInButton
    }()

    @objc private func tapAction() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    @objc private func kbdShow(notification: NSNotification) {
//        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            scrollView.contentInset.bottom = kbdSize.height
//            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
//        }
//    }
//
//    @objc private func kbdHide() {
//        scrollView.contentInset = .zero
//        scrollView.verticalScrollIndicatorInsets = .zero
//    }

    private func addView() {
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
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

        [logoImageView, logInTableView, logInButton].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                               constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            logInTableView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            logInTableView.heightAnchor.constraint(equalToConstant: 100),
            logInTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            //logInTableView.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -16)

        ])

        NSLayoutConstraint.activate([
            //logInButton.topAnchor.constraint(equalTo: logInTableView.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(UIScreen.main.bounds.height - 506))
        ])
    }

}

// MARK: - UITableViewDataSource

extension LogInViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LogInTableViewCell.identifier, for: indexPath) as! LogInTableViewCell
        return cell
    }



}

// MARK: - UITableViewDelegate

extension LogInViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }



}
