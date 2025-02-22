//
//  WhetherDetailsViewModel.swift
//  WorldWether
//
//  Created by gokul v on 26/07/24.
//

import Foundation

class WhetherDetailsViewModel {
    
    var networkManager: APIManager
    
    var models: [WhetherModel]?
    
    var lattitude: String
    var longitude: String
    
    init(lattitude: String, longitude: String, networkManager: APIManager) {
        self.lattitude = lattitude
        self.longitude = longitude
        self.networkManager = networkManager
    }
        
    func getWhetherDetails(completion: @escaping () -> Void) {
        let urlString = "https://api.weatherbit.io/v2.0/current?&lat=\(lattitude)&lon=\(longitude)&key=bce78de583f443e394c60af23a6252ad&include=minutely"

        networkManager.fetchData(urlString: urlString) { models,error  in
            if let models {
                self.models = models
                completion()
            }
        }
    }
}
