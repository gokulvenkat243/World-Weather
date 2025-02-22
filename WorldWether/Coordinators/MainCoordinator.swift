//
//  MainCoordinator.swift
//  WorldWether
//
//  Created by gokul v on 31/07/24.
//

import Foundation
import UIKit

class MainCoordinator {

    var homeCoordinator: HomeCoordinator?
    var loginCoordinator: LoginCoordinator?
    var navigationController: UINavigationController?
    
    func start(window: UIWindow?) {
        let mainVC = UIViewController()
        mainVC.view.backgroundColor = .systemBackground
        let navController = UINavigationController(rootViewController: mainVC)
        navigationController = navController
        if (UserDefaults.standard.string(forKey: "Gokul@gmail.com") != nil) {
            startHomeFlow(navController: navController)
        } else {
            startLoginFlow(navController: navController)
        }
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func startHomeFlow(navController: UINavigationController) {
        let coordinator = HomeCoordinator(navController: navController)
        coordinator.parentCoordinator = self
        self.homeCoordinator = coordinator
        coordinator.start()
    }
    
    func startLoginFlow(navController: UINavigationController) {
        let coordinator = LoginCoordinator(navController: navController)
        coordinator.parentCoordinator = self
        self.loginCoordinator = coordinator
        coordinator.start()
    }
    
    func finisedHomeFlow(navController: UINavigationController) {
        navController.popViewController(animated: true)
        startLoginFlow(navController: navController)
    }
    
    func finishedLogin(navController: UINavigationController) {
        navController.popViewController(animated: true)
        homeCoordinator?.start()
    }
}
