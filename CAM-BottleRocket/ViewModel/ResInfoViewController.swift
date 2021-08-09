//
//  ResInfoViewController.swift
//  CAM-BottleRocket
//
//  Created by Nicholas Gilbert on 6/7/21.
//

import UIKit
import MapKit
import CoreLocation

class ResInfoViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var restaurantMap: MKMapView!
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var twitterLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    var restaurantsDatas:[restaurantsDataModel] = []
    var indexHolder: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Detail Area
        restaurantLabel.text = restaurantsDatas[indexHolder].name
        categoryLabel.text = restaurantsDatas[indexHolder].category
        
        if restaurantsDatas[indexHolder].contact?.phone == nil {
            contactLabel.text = "N/A"
        } else {
            contactLabel.text = restaurantsDatas[indexHolder].contact?.formattedPhone
        }
        
        if restaurantsDatas[indexHolder].contact?.twitter == nil {
            twitterLabel.text = (restaurantsDatas[indexHolder].contact?.twitter ?? "N/A")
        } else {
            twitterLabel.text = "@" + ((restaurantsDatas[indexHolder].contact?.twitter!)!)
        }
        
        let address = restaurantsDatas[indexHolder].location!.address
        let city = restaurantsDatas[indexHolder].location!.city
        let state = restaurantsDatas[indexHolder].location!.state
        let postal = restaurantsDatas[indexHolder].location?.postalCode
        addressLabel.text = address + " " + city + " " + state + " " + (postal ?? "")
       
        //Map Area
        let lat = restaurantsDatas[indexHolder].location?.lat
        let lng = restaurantsDatas[indexHolder].location?.lng
        let location = MKPointAnnotation()
        location.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lng!)
        restaurantMap.addAnnotation(location)
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.00, longitudeDelta: 0.00)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        restaurantMap.setRegion(region, animated: true)
    }
}

