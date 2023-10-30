//
//  Buisness.swift
//  mapKitPractice
//
//  Created by Yazan Ghunaim on 10/30/23.
//

import Foundation
import MapKit

struct Buisness: Identifiable {
    let id = UUID()
    let name: String
    let placemark: MKPlacemark // description of a location on a map
    let coordinate: CLLocationCoordinate2D // lat and lon associated with location
    let phoneNumber: String
    let website: URL?
}
