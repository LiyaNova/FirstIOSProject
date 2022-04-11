//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 04.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeader = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        //self.navigationController!.navigationBar.barTintColor = .black
        //self.navigationController!.navigationBar.isTranslucent = false
        view.addSubview(profileHeader)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeader.frame = view.safeAreaLayoutGuide.layoutFrame
        profileHeader.createViews()

    }
    
}
