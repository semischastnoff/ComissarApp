//
//  PlacesViewModel.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 13.01.2022.
//

import Foundation
import MapKit

class PlacesViewModel: ObservableObject {
    static let shared: PlacesViewModel = PlacesViewModel()
    var contentViewModel: ContentViewModel = ContentViewModel.shared
    
    var placesRegions: [Place : MKCoordinateRegion] = [
        .fontanka : MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.929866, longitude: 30.340481), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)),
        .instrumentalnaya : MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.973963, longitude: 30.324287), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    ]
    
    var placesAnnotationsDict: [Place : [Barbershop]] = [
        .fontanka : [Barbershop(name: Place.fontanka.rawValue, coordinate: CLLocationCoordinate2D(latitude: 59.929866, longitude: 30.340481))],
        .instrumentalnaya : [Barbershop(name: Place.instrumentalnaya.rawValue, coordinate: CLLocationCoordinate2D(latitude: 59.973963, longitude: 30.324287))]
    ]
    
    @Published var extendMapDict: [Place : Bool] = [
        .fontanka : false,
        .instrumentalnaya : false
    ]
    
    @Published var currentPlace: Place = .fontanka
    
    func toggleExtention(of place: Place) {
        self.extendMapDict[place]?.toggle()
    }
    
    func changePlace(to place: Place) {
        self.contentViewModel.currentPlace = place
        self.currentPlace = place
        self.contentViewModel.currentPlace = place
    }
}

struct Barbershop: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
