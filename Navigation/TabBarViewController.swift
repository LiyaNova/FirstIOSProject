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
        setUpControllers()
    }

    private func setUpControllers() {
        let navControllerOne = UINavigationController(rootViewController: firstVC)
        firstVC.tabBarItem.title = "Profile"
        firstVC.tabBarItem.image = UIImage(systemName: "person")
        
        let navControllerTwo = UINavigationController(rootViewController: secondVC)
        secondVC.tabBarItem.image = UIImage(systemName: "camera")
        secondVC.tabBarItem.title = "Feed"
      
        viewControllers = [navControllerOne, navControllerTwo]
    }
    
}
