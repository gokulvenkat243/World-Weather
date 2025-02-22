//
//  HomeCoordinator.swift
//  WorldWether
//
//  Created by gokul v on 31/07/24.
//

import Foundation
import UIKit

class HomeCoordinator {
    
    let navController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    var userListCoordinator: UserListCoordinator?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let vc = HomePageViewController(viewModel: viewModel)
        self.navController.pushViewController(vc, animated: true)
    }
    
    func logout() {
        parentCoordinator?.finisedHomeFlow(navController: navController)
    }
    
    func tapToUserListView() {
        self.userListCoordinator = UserListCoordinator(navController: navController)
        self.userListCoordinator = UserListCoordinator(navController: navController)
        userListCoordinator?.start()
    }
}
