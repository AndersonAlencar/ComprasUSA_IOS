//
//  ManagerTabBarController.swift
//  ComprasUSA
//
//  Created by Anderson Alencar on 01/03/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class ManagerTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstViewController = ShoppingViewController()
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let secondViewController = SettingsViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        let thirdViewController = TaxesViewController()
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        let tabBarlist = [firstViewController,secondViewController,thirdViewController]
        viewControllers = tabBarlist
    }
    

}
