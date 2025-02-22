//
//  SignUpViewModel.swift
//  WorldWether
//
//  Created by gokul v on 30/07/24.
//

import Foundation
import CoreData
import UIKit

class SignUpViewModel {
    
    var coordinator: SignUpCoordinator
    
    init(coordinator: SignUpCoordinator) {
        self.coordinator = coordinator
    }
        
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func addUser(_ user: Model) {
        let userEntity = UserEntity(context: context)
        userEntity.email = user.email
        userEntity.password = user.password
        userEntity.firstName = user.firstName
        userEntity.lastName = user.lastName
        userEntity.address = user.address
        userEntity.phoneNumber = user.phoneNumber
        userEntity.dob = user.dob
        userEntity.gender = user.gender
        do {
            try context.save()
        }catch {
            print("error")
        }
    }
    
    func tapToSubmitUserSignUpDetails() {
        coordinator.submitButton()
    }
}
