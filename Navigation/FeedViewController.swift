//
//  FeedViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 04.04.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "My post")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeButton()
    }

    private func makeButton(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.setTitle("SEE POST", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func tapAction() {
        let vc = PostViewController()
        navigationController?.pushViewController(vc, animated: true)
        vc.titlePost = post.title
    }

}
