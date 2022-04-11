//
//  AppDelegate.swift
//  Navigation
//
//  Created by Юлия Филимонова on 31.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //UINavigationBar.appearance().barStyle = .default
        //UINavigationBar.appearance().backgroundColor = .systemGray5
        //UINavigationBar.appearance().clipsToBounds = true
        //UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

