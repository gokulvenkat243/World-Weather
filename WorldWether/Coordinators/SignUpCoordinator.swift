//
//  SignUpCoordinator.swift
//  WorldWether
//
//  Created by gokul v on 01/08/24.
//

import Foundation
import UIKit

class SignUpCoordinator {
    
    var navigationController: UINavigationController?
    
    func submitButton() {
        navigationController?.popViewController(animated: true)
    }
}
