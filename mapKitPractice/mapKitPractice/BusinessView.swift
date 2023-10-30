//
//  BusinessView.swift
//  mapKitPractice
//
//  Created by Yazan Ghunaim on 10/30/23.
//

import SwiftUI

struct BusinessView: View {
    @ObservedObject var mapController: MapContoller
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(mapController.selectedBuisnessName)
                        .font(.title)
                    
                    Text(mapController.selectedBuisnessPlacemark)
                }
                
                Spacer()
                
                Button {
                    mapController.isBuisnessViewShowing.toggle()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .tint(.secondary)
                }
            }
            
            HStack {
                ForEach(mapController.actions) { action in
                    Button {
                        action.handler()
                    } label: {
                        VStack {
                            Image(systemName: action.image)
                            Text(action.title)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .padding()
    }
}

#Preview {
    BusinessView(mapController: MapContoller())
}
