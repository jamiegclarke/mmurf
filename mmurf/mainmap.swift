//
//  mainmap.swift
//  mmurf
//
//  Created by jamie goodrick-clarke on 22/03/2022.
//

import Foundation
import MapKit

class mainmap: UIViewController {
    
    // set main map
    @IBOutlet weak var mainmap: MKMapView!
    
    override func viewDidLoad() {
        
        // set location of map
        let location = CLLocation(latitude: mapArr[connection].lat!, longitude: mapArr[connection].lng!)
        self.mainmap.centerToLocation(location)
        
        // set location label
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: mapArr[connection].lat!, longitude: mapArr[connection].lng!)
        self.mainmap.addAnnotation(annotation)
        annotation.title = locname[connection]
    }
    
    
}

