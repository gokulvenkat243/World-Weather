//
//  Coordinator.swift
//  WorldWether
//
//  Created by gokul v on 31/07/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func start()
    func loginToSigUp()
    func submitButton()
    func logout()
    func homeViewToUserList()
    func userListToDetailsPage(data: String)
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
