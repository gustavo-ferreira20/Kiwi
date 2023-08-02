//
//  CountryViewModel.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/8/1.
//

import Foundation
import SwiftUI
import CoreLocation

class CountryViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var country: EachTransaction?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                guard error == nil, let placemark = placemarks?.first else {
                    // Handle error
                    return
                }
                
                if let countryName = placemark.country {
                    DispatchQueue.main.async {
//                        self.country = EachTransaction(country: countryName)
                    }
                }
            }
        }
    }
}

