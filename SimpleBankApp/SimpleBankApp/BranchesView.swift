//
//  BranchesView.swift
//  SimpleBankApp
//
//  Created by Sergey on 29.12.2024.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct BranchesView: View {
    let layout = [
        GridItem(.adaptive(minimum: 100, maximum: 150)),
    ]
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423), span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4))
    
    let annotations = [
            Location(name: "Офис 1", coordinate: CLLocationCoordinate2D(latitude: 55.651244, longitude: 37.618423)),
            Location(name: "Офис 2", coordinate: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.518423)),
            Location(name: "Офис 3", coordinate: CLLocationCoordinate2D(latitude: 55.751244, longitude:  37.418423)),
            Location(name: "Офис 4", coordinate: CLLocationCoordinate2D(latitude: 55.791244, longitude: 37.718423)),
            Location(name: "Офис 5", coordinate: CLLocationCoordinate2D(latitude: 55.791244, longitude: 37.618423)),
            Location(name: "Офис 6", coordinate: CLLocationCoordinate2D(latitude: 55.611244, longitude: 37.698423)),
            Location(name: "Офис 7", coordinate: CLLocationCoordinate2D(latitude: 55.721244, longitude: 37.528423)),
            Location(name: "Офис 8", coordinate: CLLocationCoordinate2D(latitude: 55.731244, longitude:  37.218423)),
            Location(name: "Офис 9", coordinate: CLLocationCoordinate2D(latitude: 55.799244, longitude: 37.758423)),
            Location(name: "Офис 10", coordinate: CLLocationCoordinate2D(latitude: 55.722244, longitude: 37.518423)),
            
        ]

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: annotations) {
                MapMarker(coordinate: $0.coordinate)
            }
            .frame(maxWidth: .infinity, minHeight: 500)
            .padding(.bottom, 20)
            
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(annotations) { annotaition in
                        ZStack {
                            Color.blue
                                .frame(minWidth: 100, minHeight: 40)
                            Text("\(annotaition.name)")
                                .foregroundColor(.white)
                        }
                     
                    }
                }
            }
        }
    }
}

struct BranchesView_Previews: PreviewProvider {
    static var previews: some View {
        BranchesView()
    }
}
