//
//  CollectionViewCell.swift
//  CAM-BottleRocket
//
//  Created by Nicholas Gilbert on 6/7/21.
//

import UIKit
import Foundation

class restaurantsDataModel {
    let name: String
    var backgroundImageURL: URL
    let category: String
    let contact: Contacts?
    let location: Locations?
    
    init(name: String,
        backgroundImageURL: URL,
        category: String,
        contact: Contacts?,
        location: Locations?)
    {
    self.name = name
    self.backgroundImageURL = backgroundImageURL
    self.category = category
    self.contact = contact
    self.location = location
    }
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var RestaurantLabel: UILabel!
    @IBOutlet weak var imageBG: UIImageView!
    @IBOutlet weak var CategoryLabel: UILabel!
    
    static let identifier = "CollectionViewCell"
 
    func configure(with lunchModel: restaurantsDataModel) {
        self.RestaurantLabel.text = lunchModel.name
        self.CategoryLabel.text = lunchModel.category
        
        if self.imageBG != nil {
            let url = lunchModel.backgroundImageURL
        // Create Data Task
            let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
              if let idata = data {
                  DispatchQueue.main.async {
                      // Create Image and Update Image View
                    self?.imageBG.image = UIImage(data: idata)
                    self?.imageBG.alpha = 0.97
                    }
                }
            }
          // Start Data Task
          dataTask.resume()
        }
    }
}
