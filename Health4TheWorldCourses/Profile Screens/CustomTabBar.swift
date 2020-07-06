//
//  CustomTabBar.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 2/16/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tabBar.items?[0].title = Constants.titles.home
        self.tabBar.items?[1].title = Constants.titles.home
        self.tabBar.items?[2].title = Constants.titles.home
//        viewControllers = [     createNavController(title: titles[0], imageName: imageNamesActive[0], rootViewController: HomeViewController()),createNavController(title: titles[1], imageName: imageNamesActive[1], rootViewController: SavedViewController()),createNavController(title: titles[2], imageName: imageNamesActive[2], rootViewController: ProfileViewController())]

    }

 
}
