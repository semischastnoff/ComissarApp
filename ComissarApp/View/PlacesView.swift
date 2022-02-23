//
//  PlacesView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 13.01.2022.
//

import SwiftUI
import MapKit

struct PlacesView: View {
    @StateObject var placesViewModel: PlacesViewModel = PlacesViewModel.shared
    
    @State private var fontankaRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.929866, longitude: 30.340481), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var instrumentalnayaRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.973963, longitude: 30.324287), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        GeometryReader { gp in
            if self.placesViewModel.extendMapDict[.fontanka] ?? false {
                ZStack {
                    Map(coordinateRegion: self.$fontankaRegion,
                        annotationItems: self.placesViewModel.placesAnnotationsDict[.fontanka] ?? []) { location in
                        MapMarker(coordinate: location.coordinate, tint: .black)
                    }
                        .frame(width: gp.size.width, height: gp.size.height, alignment: .center)
                    
                    Button {
                        withAnimation(.spring()) {
                            self.placesViewModel.toggleExtention(of: .fontanka)
                        }
                    } label: {
                        Image(systemName: self.placesViewModel.extendMapDict[.fontanka] ?? false ? "arrow.down.right.and.arrow.up.left" : "arrow.up.left.and.arrow.down.right")
                            .foregroundColor(.black)
                            .padding(5)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                            .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                    }
                    .position(x: gp.size.width - 30, y: 25)
                }
                .transition(.scale)
            } else if self.placesViewModel.extendMapDict[.instrumentalnaya] ?? false {
                ZStack {
                    Map(coordinateRegion: self.$instrumentalnayaRegion,
                        annotationItems: self.placesViewModel.placesAnnotationsDict[.instrumentalnaya] ?? []) { location in
                        MapMarker(coordinate: location.coordinate, tint: .black)
                    }
                        .frame(width: gp.size.width, height: gp.size.height, alignment: .center)
                    
                    Button {
                        withAnimation(.spring()) {
                            self.placesViewModel.toggleExtention(of: .instrumentalnaya)
                        }
                    } label: {
                        Image(systemName: self.placesViewModel.extendMapDict[.instrumentalnaya] ?? false ? "arrow.down.right.and.arrow.up.left" : "arrow.up.left.and.arrow.down.right")
                            .foregroundColor(.black)
                            .padding(5)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                            .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                    }
                    .position(x: gp.size.width - 30, y: 25)
                }
                .transition(.scale)
            } else {
                ScrollView {
                    ScrollViewReader { sr in
                        //MARK: fontanka
                        VStack {
                            ZStack {
                                Map(coordinateRegion: self.$fontankaRegion,
                                    annotationItems: self.placesViewModel.placesAnnotationsDict[.fontanka] ?? []) { location in
                                    MapMarker(coordinate: location.coordinate, tint: .black)
                                }
                                    .frame(width: gp.size.width - 40, height: gp.size.height / 4, alignment: .center)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                                
                                Button {
                                    withAnimation(.spring()) {
                                        self.placesViewModel.toggleExtention(of: .fontanka)
                                    }
                                } label: {
                                    Image(systemName: self.placesViewModel.extendMapDict[.fontanka] ?? false ? "arrow.down.right.and.arrow.up.left" : "arrow.up.left.and.arrow.down.right")
                                        .foregroundColor(.black)
                                        .padding(5)
                                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                                        .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                                }
                                .position(x: gp.size.width - 50, y: 25)
                            }
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Набережная реки Фонтанка, 54")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Spacer()
                                    Button {
                                        withAnimation(.easeInOut) {
                                            self.placesViewModel.changePlace(to: .fontanka)
                                        }
                                    } label: {
                                        Image(systemName: self.placesViewModel.currentPlace == .fontanka ? "checkmark" : "xmark")
                                            .font(.title2)
                                            .frame(width: 40, height: 40, alignment: .center)
                                            .foregroundColor(.primary)
                                            .background(self.placesViewModel.currentPlace == .fontanka ? .green.opacity(0.4) : .red.opacity(0.4), in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                                            .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                                    }
                                }
                                Text("Вход со двора, как подойдете к нашим окнам, позвоните, и мы Вас встретим")
                                Text("Ближайший доступный сеанс для записи: \n18 января в 12:00")
                                    .padding(.vertical)
                            }
                            .frame(width: gp.size.width - 40)
                        }
                        .padding(.vertical, 20)
                        
                        //MARK: instrumentalnaya
                        VStack {
                            ZStack {
                                Map(coordinateRegion: self.$instrumentalnayaRegion,
                                    annotationItems: self.placesViewModel.placesAnnotationsDict[.instrumentalnaya] ?? []) { location in
                                    MapMarker(coordinate: location.coordinate, tint: .black)
                                }
                                    .frame(width: gp.size.width - 40, height: gp.size.height / 4, alignment: .center)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                                
                                Button {
                                    withAnimation(.spring()) {
                                        self.placesViewModel.toggleExtention(of: .instrumentalnaya)
                                    }
                                } label: {
                                    Image(systemName: self.placesViewModel.extendMapDict[.instrumentalnaya] ?? false ? "arrow.down.right.and.arrow.up.left" : "arrow.up.left.and.arrow.down.right")
                                        .foregroundColor(.black)
                                        .padding(5)
                                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                                        .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                                }
                                .position(x: gp.size.width - 50, y: 25)
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("ул. Инструментальная, 3г м. Петроградская")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Spacer()
                                    Button {
                                        withAnimation(.easeInOut) {
                                            self.placesViewModel.changePlace(to: .instrumentalnaya)
                                        }
                                    } label: {
                                        Image(systemName: self.placesViewModel.currentPlace == .instrumentalnaya ? "checkmark" : "xmark")
                                            .font(.title2)
                                            .frame(width: 40, height: 40, alignment: .center)
                                            .foregroundColor(.primary)
                                            .background(self.placesViewModel.currentPlace == .instrumentalnaya ? .green.opacity(0.4) : .red.opacity(0.4), in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                                            .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
                                    }
                                }
                                Text("Вход в спортзал")
                                Text("Ближайший доступный сеанс для записи: \n18 января в 12:00")
                                    .padding(.vertical)
                            }
                            .frame(width: gp.size.width - 40)
                        }
                        .padding(.bottom, 100)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
    }
}
