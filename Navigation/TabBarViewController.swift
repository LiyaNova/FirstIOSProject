//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 04.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    let firstVC = ProfileViewController()
    let secondVC = FeedViewController()



    override func viewDidLoad() {
        super.viewDidLoad()

        setupControllers()
    }

    private func setupControllers() {
        let navControllerOne = UINavigationController(rootViewController: firstVC)
        firstVC.tabBarItem.title = "Profile"
        firstVC.tabBarItem.image = UIImage(systemName: "bolt")

        let navControllerTwo = UINavigationController(rootViewController: secondVC)
        secondVC.tabBarItem.image = UIImage(systemName: "bolt")
        secondVC.tabBarItem.title = "Feed"

        viewControllers = [navControllerOne, navControllerTwo]

    }
}
