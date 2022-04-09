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
        view.backgroundColor = .blue
        makeButton()
    }

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func tapAction() {
        let alert = UIAlertController(title: "Go back", message: "Do you want to go back?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Back", style: .default) { _ in
            self.dismiss(animated: true)
            print("Нажата кнопка okAction")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("Нажата кнопка cancelAction")
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
