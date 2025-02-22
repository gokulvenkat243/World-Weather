//
//  UserListVM.swift
//  WorldWether
//
//  Created by gokul v on 30/07/24.
//

import Foundation
import CoreData
import UIKit

class UserListViewModel {
    
    var coordinator: UserListCoordinator
    
    init(coordinator: UserListCoordinator) {
        self.coordinator = coordinator
    }
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    var userData: [UserEntity] = []
    
    func fetchUserName(searchText: String) {
        let context = context
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        if !searchText.isEmpty {
            fetchRequest.predicate = NSPredicate(format: "firstName CONTAINS %@", searchText)
        }
        do {
            userData = try! context?.fetch(fetchRequest) as! [UserEntity]
        }   
    }
    
    func fetchUser() -> [UserEntity] {
        var users: [UserEntity] = []
        do{
            users = try (context?.fetch(UserEntity.fetchRequest()) as? [UserEntity])!
        }catch {
            print("error")
        }
        return users
    }
    
    func userListToDetailsPage(data: String) {
        coordinator.userListToDetailsPage(data: data)
    }
    
}
