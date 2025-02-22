//
//  UserListCoordinator.swift
//  WorldWether
//
//  Created by gokul v on 31/07/24.
//

import Foundation
import UIKit

class UserListCoordinator {
    
    var navController: UINavigationController
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let viewModel = UserListViewModel(coordinator: self)
        let vc = UserListViewController(viewModel: viewModel)
        navController.pushViewController(vc, animated: true)
    }
    
    func userListToDetailsPage(data: String) {
        let viewModel = UserDetailsViewModel(data: data, coordinator: self)
        let vc = UserDetailsViewController(viewModel: viewModel)
        navController.pushViewController(vc, animated: true)
    }
}
