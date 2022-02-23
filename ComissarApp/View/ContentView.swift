//
//  ContentView.swift
//  ComissarApp
//
//  Created by Данила Семисчастнов on 09.01.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel: ContentViewModel = ContentViewModel.shared
    @StateObject var placesViewModel: PlacesViewModel = PlacesViewModel.shared
    
    var body: some View {
        ZStack {
            ZStack {
                VStack(spacing: 0) {
                    self.navBar
                        .background(.ultraThinMaterial)
                    self.mainView
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                self.tabBar
            }
            .blur(radius: self.contentViewModel.showProfileView ? 80 : 0)
            if self.contentViewModel.showProfileView {
                ProfileView()
                    .transition(.asymmetric(insertion: .scale, removal: .scale))
            }
        }
    }
    
    var mainView: some View {
        Group {
            switch self.contentViewModel.currentTab {
            case .visit:
                VisitView()
                    .transition(.opacity)
            case .places:
                PlacesView()
                    .transition(.opacity)
            case .myVisits:
                MyVisitsView()
                    .transition(.opacity)
            case .about:
                AboutView()
                    .transition(.opacity)
            }
        }
    }
    
    var navBar: some View {
        HStack {
            VStack {
                Text(self.contentViewModel.currentTab.rawValue)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Menu {
                    ForEach(Place.allCases, id: \.self) { item in
                        Button {
                            withAnimation(.easeInOut) {
                                self.placesViewModel.changePlace(to: item)
                            }
                        } label: {
                            Text(item.rawValue)
                        }
                    }
                } label: {
                    HStack {
                        Text(self.contentViewModel.currentPlace.rawValue)
                            .fontWeight(.bold)
                        Image(systemName: "arrow.right")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(.primary)
            }
            Button {
                withAnimation(.easeOut) {
                    self.contentViewModel.openProfileView()
                }
            } label: {
                Image(systemName: "person.crop.circle.fill")
                    .font(.title2)
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.primary)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .shadow(color: .primary.opacity(0.3), radius: 30, x: 5, y: 10)
            }
        }
        .padding()
    }
    
    var tabBar: some View {
        GeometryReader { gp in
            HStack(alignment: .bottom) {
                ForEach(Tab.allCases, id: \.self) { item in
                    Button {
                        withAnimation(.spring()) {
                            self.contentViewModel.changeCurrentTab(to: item)
                        }
                    } label: {
                        VStack {
                            Image(systemName: self.contentViewModel.tabBarImagesDict[item] ?? "plus")
                            Text(item.rawValue)
                                .font(.caption2)
                        }
                        .padding(.vertical)
                        .foregroundColor(self.contentViewModel.currentTab == item ? .blue : .primary.opacity(0.6))
                    }
                    .buttonStyle(.plain)
                    if item != .about {
                        Spacer()
                    }
                }
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 20)
            .padding(.horizontal, 25)
            .background(.ultraThinMaterial)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
