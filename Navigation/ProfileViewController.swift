//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 02.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenWidth = UIScreen.main.bounds.width
       // let screenHeight = UIScreen.main.bounds.height

        if let myView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            myView.frame = CGRect(x: 20, y: 70 , width: screenWidth - 40, height: 400)
            view.addSubview(myView)
        }
    }
}
