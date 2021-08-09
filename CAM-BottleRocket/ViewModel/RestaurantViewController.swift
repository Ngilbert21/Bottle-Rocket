//
//  ViewController.swift
//  CAM-BottleRocket
//
//  Created by Nicholas Gilbert on 6/7/21.
//

import UIKit
import MapKit
import CoreLocation

class RestaurantViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate  {
   
    @IBOutlet var restaurantCollection: UICollectionView!
    
    
    var restaurantData = [restaurantsDataModel]()
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantCollection.delegate = self
        restaurantCollection.dataSource = self
     
        NetworkManager.shared.getAllLunchData { [weak self] result in
            switch result {
            case .success(let models):
                self?.restaurantData = models.restaurants.compactMap({ Restaurants in

               return restaurantsDataModel(
                        name: Restaurants.name,
                        backgroundImageURL: Restaurants.backgroundImageURL,
                        category: Restaurants.category,
                        contact: Restaurants.contact,
                        location: Restaurants.location)
                })
                DispatchQueue.main.async {
                    self?.restaurantCollection.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CollectionViewCell",
             for: indexPath
         ) as? CollectionViewCell else {
             fatalError()
         }

        cell.configure(with: restaurantData[indexPath.row])
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        performSegue(withIdentifier: "LoadData", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.destination)
        if let destination = segue.destination as? ResInfoViewController {
            destination.restaurantsDatas = self.restaurantData
            destination.indexHolder = self.selectedIndex
            print(destination.restaurantsDatas as Any)
        }
        if let destination = segue.destination as? RestaurantMapViewController {
            destination.restaurantsDatas = self.restaurantData
            print(destination.restaurantsDatas as Any)
        }
    }
}
