//
//  restModel.swift
//  CAM-BottleRocket
//
//  Created by Nicholas Gilbert on 6/8/21.
//

import Foundation

struct restModel: Codable {
    let name: String
    let backgroundImageURL: String
    let category: String
    let contact: Contacts?
    let location: Locations?
    
    init(with model:Restaurants){
        name = model.name
        backgroundImageURL = model.backgroundImageURL
        category = model.category
        contact = model.contact
        location = model.location
    }
}
