//
//  RestaurantModel.swift
//  CAM-BottleRocket
//
//  Created by Christian Mallapre on 6/7/21.
//

import Foundation

struct RestaurantsData: Codable {
    let restaurants: [Restaurants]
}

struct Restaurants: Codable {
       let name: String
       var backgroundImageURL: URL
       let category: String
       let contact: Contacts?
       let location: Locations?
}

struct Contacts: Codable {
    let phone: String
    let formattedPhone: String
    let twitter: String?
}

struct Locations: Codable {
    let address: String
    let crossStreet: String?
    let lat: Double
    let lng: Double
    let postalCode: String?
    let cc: String
    let city: String
    let state: String
    let country: String
    let formattedAddress: [String]
}


