//
//  InfoViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 04.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeButton()
    }

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.setTitle("BACK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blueTheme
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func tapAction() {
        let alert = UIAlertController(title: "Go back", message: "Do you really want to go back?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) { _ in
            self.dismiss(animated: true)
            print("Сработала кнопка Yes")
        }
        let cancelAction = UIAlertAction(title: "No", style: .destructive) { _ in
            print("Сработала кнопка No")
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}
