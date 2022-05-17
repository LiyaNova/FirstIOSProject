//
//  PostViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 04.04.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        barButtonItem()
    }

    private func barButtonItem() {
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barItem
    }

    @objc private func tapAction() {
        let vc = InfoViewController()
        present(vc, animated: true)
    }
    
}
