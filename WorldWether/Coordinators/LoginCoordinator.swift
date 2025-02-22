//
//  SignUpCoordinator.swift
//  WorldWether
//
//  Created by gokul v on 31/07/24.
//

import Foundation
import UIKit

class LoginCoordinator {

    weak var parentCoordinator: MainCoordinator?
    var navController: UINavigationController
    var signUpCoordinator = SignUpCoordinator()
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let viewModel = LoginViewModel(loginCoordinator: self)
        let vc = LoginPageViewController(viewModel: viewModel)
        self.navController.pushViewController(vc, animated: true)
    }
    
    func tapToSignUpView() {
        let viewModel = SignUpViewModel(coordinator: signUpCoordinator)
        let vc = SignUpPageViewController(viewModel: viewModel)
        self.navController.pushViewController(vc, animated: true)
    }
    
    func finishedLogin() {
        parentCoordinator?.finishedLogin(navController: navController)
    }
}
