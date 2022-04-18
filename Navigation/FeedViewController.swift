//
//  FeedViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 04.04.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "My post")

    private lazy var upperButton: UIButton = {
        let upperButton = UIButton()
        upperButton.translatesAutoresizingMaskIntoConstraints = false
        upperButton.setTitle("See Post", for: .normal)
        upperButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        upperButton.tintColor = .white
        upperButton.layer.cornerRadius = 4
        upperButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return upperButton
    }()

    private lazy var lowerButton: UIButton = {
        let lowerButton = UIButton()
        lowerButton.translatesAutoresizingMaskIntoConstraints = false
        lowerButton.setTitle("See Post", for: .normal)
        lowerButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        lowerButton.tintColor = .white
        lowerButton.layer.cornerRadius = 4
        lowerButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return lowerButton
    }()

    private let stackButtonView: UIStackView = {
        let stackButtonView = UIStackView()
        stackButtonView.translatesAutoresizingMaskIntoConstraints = false
        stackButtonView.axis = .vertical
        stackButtonView.distribution = .fillEqually
        stackButtonView.spacing = 10
        return stackButtonView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeButtonStack()
    }

    private func makeButtonStack(){
        view.addSubview(stackButtonView)
        [upperButton, lowerButton].forEach {stackButtonView.addArrangedSubview($0)}

        NSLayoutConstraint.activate([
            upperButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            upperButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            upperButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            lowerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lowerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lowerButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            stackButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }

    @objc private func tapAction() {
        let vc = PostViewController()
        vc.titlePost = post.title
        navigationController?.pushViewController(vc, animated: true)
    }

}
