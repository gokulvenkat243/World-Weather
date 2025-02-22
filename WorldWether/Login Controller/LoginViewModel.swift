//
//  LoginViewModel.swift
//  WorldWether
//
//  Created by gokul v on 29/07/24.
//

import Foundation
import CoreData
import UIKit

protocol AlertMessageDelegatae {
    func alertMessageDelegate(message: String)
}

class LoginViewModel {
    
    var delegate: AlertMessageDelegatae?
    
    var loginCoordinator: LoginCoordinator
    
    init(loginCoordinator: LoginCoordinator) {
        self.loginCoordinator = loginCoordinator
    }
            
    func authenticationManager(email: String, password: String, completion: @escaping () -> Void) {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        do {
            let result = try? context?.fetch(fetchRequest)
            if let userEntity = result?.first as? NSManagedObject {
                let storedPassword = userEntity.value(forKey: "password")
                if password == storedPassword as! String {
                    completion()
                    UserDefaults.standard.setValue(email, forKey: "Gokul@gmail.com")
                    self.finishedLogin()

                }
                else {
                    delegate?.alertMessageDelegate(message: "Invalid Password. Please Try Again")
                }
            }
            else {
                delegate?.alertMessageDelegate(message: "Invalid Email. Please Try Again")
            }
        }
    }
    
    func loggedUser() -> Void {
        UserDefaults.standard.string(forKey: "Gokul@gmail.com")
    }
    
    func finishedLogin() {
        loginCoordinator.finishedLogin()
    }
    
    func openSignUpPage() {
        loginCoordinator.tapToSignUpView()
    }
}
