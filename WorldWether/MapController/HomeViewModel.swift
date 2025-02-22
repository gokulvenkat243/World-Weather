//
//  HomeViewModel.swift
//  WorldWether
//
//  Created by gokul v on 29/07/24.
//

import Foundation
import CoreData
import UIKit

class HomeViewModel {
    
    var userName: [UserEntity] = []

    var coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    func getUserName(completion: @escaping ()  -> Void) {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        guard let email = UserDefaults.standard.string(forKey: "Gokul@gmail.com") else { return }
        let predicate = NSPredicate(format: "email == %@", email)
        fetchRequest.predicate = predicate
        do {
            userName = try! context?.fetch(fetchRequest) as! [UserEntity]
            completion()
        }
    }
    
    func autoLogged() -> Void {
        UserDefaults.standard.set(false, forKey: "Gokul@gmail.com")
    }
    
    func extractGps(input: String) -> [String] {
        var input = input
        input.removeFirst()
        input.removeLast()
        var result = ""
        let array = Array(input)
        for index in 0..<array.count {
            result.append(array[index])
        }
        var split = result.components(separatedBy: ">")
        split.removeLast()
        return split[0].components(separatedBy: ",")
    }
    
    func tapToLogout() {
        coordinator.logout()
    }
    
    func tapToUserListView() {
        coordinator.tapToUserListView()
    }
}
