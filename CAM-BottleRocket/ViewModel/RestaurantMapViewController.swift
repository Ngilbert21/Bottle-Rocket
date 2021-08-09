//
//  RestaurantMapViewController.swift
//  CAM-BottleRocket
//
//  Created by Nicholas Gilbert on 6/9/21.
//

import UIKit
import MapKit
import CoreLocation

class RestaurantMapViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var restaurantsAnnotations: MKMapView!
    var restaurantsDatas:[restaurantsDataModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        var locations = [MKPointAnnotation]()
  
        for item in restaurantsDatas {
            let lat = item.location?.lat
            let lng = item.location?.lng
            let name = item.name
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = CLLocationCoordinate2D(latitude: lat!,longitude: lng!)
            annotation.title = name
            self.restaurantsAnnotations.addAnnotation(annotation)
            self.restaurantsAnnotations.selectAnnotation( annotation, animated: true)
            locations.append(annotation)
            self.restaurantsAnnotations.showAnnotations(locations, animated: true)
            
        }
        
    }
}
