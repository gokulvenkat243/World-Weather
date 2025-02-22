//
//  WhetherModel.swift
//  WorldWether
//
//  Created by gokul v on 24/07/24.
//

import Foundation

struct Models: Codable {
    let data: [WhetherModel]
}

struct WhetherModel: Codable {
    let city_name: String?
    let app_temp: Double?
}
