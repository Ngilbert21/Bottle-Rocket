//
//  AnnotationFormat.swift
//  CAM-BottleRocket
//
//  Created by Christian Mallapre on 6/9/21.
//

import Foundation
import MapKit
import Contacts

class AnnotationFormat: NSObject, MKAnnotation {
  let title: String?
  let subtitle: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    subtitle: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.subtitle = subtitle
    self.coordinate = coordinate
    super.init()
  }
    var mapItem: MKMapItem? {
      guard let location = subtitle else {
        return nil
      }
      
      let addressDict = [CNPostalAddressStreetKey: location]
      let placemark = MKPlacemark(
        coordinate: coordinate,
        addressDictionary: addressDict)
        
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = title
      return mapItem
    }
  }
