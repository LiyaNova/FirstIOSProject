//
//  LogInViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 17.04.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {

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

    private func addView() {
        [logoImageView, logInTableView, logInButton].forEach({view.addSubview($0)})

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            logInTableView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            logInTableView.heightAnchor.constraint(equalToConstant: 100),
            logInTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            //logInTableView.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -16)

        ])

        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: logInTableView.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

}

// MARK: - UITableViewDataSource

extension LogInViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LogInTableViewCell.identifier, for: indexPath)
        return cell
    }



}

// MARK: - UITableViewDelegate

extension LogInViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }



}
