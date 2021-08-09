//
//  NetworkManager.swift
//  CAM-BottleRocket
//
//  Created by Nicholas Gilbert on 6/7/21.
//

import Foundation
import UIKit

 class NetworkManager {
    static let shared = NetworkManager()
     struct Constants {
    
        static let assetEndpoint = "https://s3.amazonaws.com/br-codingexams/restaurants.json"
    }
     init() {}
    public func getAllLunchData(
        completion: @escaping (Result<RestaurantsData, Error>) -> Void
    ) {
        
        guard let url = URL(string: Constants.assetEndpoint) else {
        return
    }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let Lunch = try JSONDecoder().decode(RestaurantsData.self, from: data)
                completion(.success(Lunch))
                print("Data ", Lunch)
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
 }
