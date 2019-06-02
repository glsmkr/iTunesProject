//
//  TunesSearchTabController.swift
//  TunesSearch
//
//  Created by Julian A. Fordyce on 6/2/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class TunesSearchTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieTVC = MovieTableViewController()
        movieTVC.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let appsTVC = AppsTableViewController()
        appsTVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let musicTVC = MusicTableViewController()
        musicTVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        let viewControllerList = [musicTVC, appsTVC, movieTVC]
        
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
    


}
