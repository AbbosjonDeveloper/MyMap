//
//  LocationsListView.swift
//  MapApp
//
//  Created by Abbos on 09/12/23.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        
        List {
            ForEach(vm.locations) { location in
                Button(action: {
                    vm.showNextLocation(location: location)
                }, label: {
                    listRowview(location: location)
                })
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
extension LocationsListView {
    
    private func listRowview(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack (alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
