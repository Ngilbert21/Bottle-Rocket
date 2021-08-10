//
//  restViewModel.swift
//  CAM-BottleRocket
//
//  Created by Nicholas Gilbert on 6/8/21.
//

import Foundation

struct restViewNodel: Codable {
    let name: String
    let backgroundImageURL: String
    let category: String
    let contact: Contact?
    
    init(with model:Restaurant){
        name = model.name
        backgroundImageURL = model.backgroundImageURL
        category = model.category
        contact = model.contact
    }
}
