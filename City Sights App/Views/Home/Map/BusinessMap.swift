//
//  BusinessMap.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    var locations: [MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        for business in model.restaurants + model.sights {
            
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
            
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                annotation.title = business.name ?? ""
                
                annotations.append(annotation)
            }
        }
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        // Make user show up on map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        return mapView
    }
 
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Remove annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Add based on business
        uiView.showAnnotations(self.locations, animated: true)
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
        uiView.removeAnnotations(uiView.annotations)
    }
}
