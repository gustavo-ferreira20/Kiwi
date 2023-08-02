//
//  LocationViewModel.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/8/1.
//

import SwiftUI
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var country: String?
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func fetchCountryName() {
        locationManager.requestLocation()
        DispatchQueue.main.async { 
            if let location = self.locationManager.location {
                let geocoder = CLGeocoder()
                geocoder.reverseGeocodeLocation(location) { placemarks, error in
                    guard error == nil, let placemark = placemarks?.first else {
                        // Handle error
                        self.country = nil
                        return
                    }

                    if let countryName = placemark.country {
                        self.country = countryName
                    } else {
                        self.country = nil
                    }
                }
            } else {
                self.country = nil
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // This method is called when the location manager receives updated location data.
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error: \(error.localizedDescription)")
    }


}






