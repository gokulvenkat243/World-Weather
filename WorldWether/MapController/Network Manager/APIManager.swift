//
//  APIViewModel.swift
//  WorldWether
//
//  Created by gokul v on 26/07/24.
//

import Foundation

class APIManager {
        
    func fetchData(urlString: String, completion: @escaping([WhetherModel]?, String?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        print("before \(Thread.isMainThread)")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print("after \(Thread.isMainThread)")
            if let data {
                let fetchJsonData = try? JSONDecoder().decode(Models.self, from: data)
                completion(fetchJsonData?.data, nil)
            } else {
                completion(nil, "Error")
            }
        }
        task.resume()
    }
}
