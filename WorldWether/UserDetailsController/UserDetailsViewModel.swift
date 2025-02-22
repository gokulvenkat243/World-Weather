//
//  UserDetailsVM.swift
//  WorldWether
//
//  Created by gokul v on 30/07/24.
//

import Foundation
import CoreData
import UIKit

class UserDetailsViewModel {
        
    var data: String
    var coordinator: UserListCoordinator
    
    init(data: String, coordinator: UserListCoordinator) {
        self.data = data
        self.coordinator = coordinator
    }
    
    var userData: [UserEntity] = []
    
    func fetchUserDetails() {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        let predicate = NSPredicate(format: "firstName == %@", data)
        fetchRequest.predicate = predicate
        do {
            userData = try! context?.fetch(fetchRequest) as! [UserEntity]
        }
    }
}
