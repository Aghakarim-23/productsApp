//
//  MainTabbarController.swift
//  ProductsApp
//
//  Created by Agakerim Hemidzade on 24.07.26.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let productsViewController = ProductsViewController()
        let profileViewController = ProfileViewController()
        
        let productsNavVC = UINavigationController(rootViewController: productsViewController)
        let profileNavVc = UINavigationController(rootViewController: profileViewController)

        productsNavVC.tabBarItem = UITabBarItem(
            title: "Products",
            image: UIImage(systemName: "bag"),
            selectedImage: UIImage(systemName: "bag.fill")
        )
        
        
        profileNavVc.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        

        viewControllers = [productsNavVC, profileNavVc]
    }

}
