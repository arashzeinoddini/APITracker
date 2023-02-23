//
//  RightView.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/23/23.
//

import SwiftUI


struct RightView: View {
    @StateObject var countriesVM = CountriesViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(countriesVM.countries) { country in
                    CountryRow(country: country)
                }
            }
            .task {
                await countriesVM.getAll()
            }
            .navigationTitle("Countries")
            .listStyle(PlainListStyle())
        }
    }
}

struct RightView_Previews: PreviewProvider {
    static var previews: some View {
        RightView()
    }
}

