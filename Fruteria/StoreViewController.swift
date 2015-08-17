//
//  SecondViewController.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 12/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit
import MapKit

class StoreViewController: UIViewController {

  
  
  @IBOutlet weak var mapView: MKMapView!
  
  let coordinate = CLLocationCoordinate2D(latitude: 35.816667, longitude: -80.258611)

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let mapRect = MKCoordinateRegionMakeWithDistance(coordinate, 10000, 10000)
    mapView.setRegion(mapRect, animated: false)
  }

  


}

