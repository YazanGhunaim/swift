//
//  MapContoller.swift
//  mapKitPractice
//
//  Created by Yazan Ghunaim on 10/30/23.
//

import MapKit

class MapContoller: ObservableObject {
    var searchTerm = String()
    
    @Published var isBuisnessViewShowing = false
    @Published private(set) var buisnesses = [Buisness]()
    @Published private(set) var selectedBuisness: Buisness?
    @Published private(set) var actions = [Action]()
    
    // rectangular region on map
    var region = MKCoordinateRegion (
        center: CLLocationCoordinate2D(latitude: 50.0755, longitude: 14.4378),
        latitudinalMeters: 1600,
        longitudinalMeters: 1600
    )
    
    var selectedBuisnessName: String {
        guard let selectedBuisness = selectedBuisness else { return "" }
        return selectedBuisness.name
    }
    
    var selectedBuisnessPlacemark: String {
        guard let selectedBuisness = selectedBuisness else { return "??" }
        return selectedBuisness.placemark.title ?? "??"
    }
    
    func search() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else { return }
            
            DispatchQueue.main.async {
                self.buisnesses = response.mapItems.map { item in
                    Buisness(name: item.name ?? "", placemark: item.placemark, coordinate: item.placemark.coordinate, phoneNumber: item.phoneNumber ?? "", website: item.url)
                }
            }
        }
        createActions()
    }
    
    func openMap(coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
    }
    
    func setSelectedBusiness(for business: Buisness) {
        selectedBuisness = business
        isBuisnessViewShowing.toggle()
    }
    
    func createActions() {
        actions = [
            Action(title: "Directions", image: "car.fill") { [weak self] in
                guard let self = self else { return }
                self.openMap(coordinate: self.selectedBuisness!.coordinate)
            },
            Action(title: "Call", image: "phone.fill") { [weak self] in
                guard let self = self else { return }
                guard let phoneNumber = self.selectedBuisness?.phoneNumber else { return }
                guard let url = URL(string: self.convertPhoneNumberFormat(phoneNumber: phoneNumber)) else { return }
                UIApplication.shared.open(url)
            },
            Action(title: "Website", image: "safari.fill") { [weak self] in
                guard let self = self else { return }
                guard let website = self.selectedBuisness?.website else { return }
                UIApplication.shared.open(website)
            }
        ]
    }
    
    func convertPhoneNumberFormat(phoneNumber: String) -> String {
        let strippedPhoneNumber = phoneNumber
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
        
        return "tel//\(strippedPhoneNumber)"
    }
}
