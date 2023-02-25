//
//  CountriesDetailView.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/25/23.
//

import SwiftUI

struct CountryDetailsView: View {
    var country : Country?
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("Official Name").font(.headline)
                    Text(country?.name?.official ?? "N/A")
                }
                HStack {
                    Text("Common Name").font(.headline)
                    Text(country?.name?.common ?? "N/A")
                }
                HStack {
                    Text("Flag").font(.headline)
                    Text(country?.flag ?? "N/A")
                }
                HStack {
                    Text("Population").font(.headline)
                    Text("\(country?.population ?? 0)")
                }
            }
        }
        .navigationTitle("Country Details")
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView()
    }
}
