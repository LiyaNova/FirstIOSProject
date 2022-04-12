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

//        if #available(iOS 13, *) {
//            let statusBar1 =  UIView()
//            statusBar1.frame = UIApplication.shared.statusBarFrame
//            statusBar1.backgroundColor = UIColor.red
//            UIApplication.shared.keyWindow?.addSubview(statusBar1)
//        }

        view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        view.addSubview(profileHeader)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeader.frame = view.safeAreaLayoutGuide.layoutFrame
        profileHeader.createViews()

    }
    
}
