//
//  MapView.swift
//  mapKitPractice
//
//  Created by Yazan Ghunaim on 10/30/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var mapController: MapContoller
    
    var body: some View {
        Map(coordinateRegion: $mapController.region, annotationItems: mapController.buisnesses) { business in
            MapAnnotation(coordinate: business.coordinate) {
                Image(systemName: "mappin.and.ellipse")
                    .font(.title)
                    .foregroundStyle(.pink)
                    .onTapGesture {
                        mapController.setSelectedBusiness(for: business)
                    }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .sheet(isPresented: $mapController.isBuisnessViewShowing) {
            BusinessView(mapController: mapController)
                .presentationDetents([.fraction(0.27), .large])
        }
    }
}

#Preview {
    MapView(mapController: MapContoller())
}
