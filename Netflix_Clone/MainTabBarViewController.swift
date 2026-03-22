//
//  ViewController.swift
//  Netflix_Clone
//
//  Created by Pedro Augusto on 22/03/26.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    private func configure() {
        view.backgroundColor = .systemYellow
        tabBar.tintColor = .label
        
        setViewControllers([
            configureHomeViewController(),
            configureSearchViewController(),
            configureUpcomingViewController(),
            configureDownloadsViewController()
        ], animated: true)
    }
    
    
    private func configureHomeViewController() -> UINavigationController {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.title = "Home"
        return homeViewController
    }
    
    
    private func configureUpcomingViewController() -> UINavigationController {
        let upcomingViewController = UINavigationController(rootViewController: UpcomingViewController())
        upcomingViewController.tabBarItem.image = UIImage(systemName: "play.circle")
        upcomingViewController.title = "Coming Soon"
        return upcomingViewController
    }
    
    
    private func configureSearchViewController() -> UINavigationController {
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchViewController.title = "Top Search"
        return searchViewController
    }
    
    
    private func configureDownloadsViewController() -> UINavigationController {
        let downloadsViewController = UINavigationController(rootViewController: DownloadsViewController())
        downloadsViewController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        downloadsViewController.title = "Downloads"
        return downloadsViewController
    }
}
