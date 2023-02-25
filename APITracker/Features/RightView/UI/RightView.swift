//
//  RightView.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/23/23.
//

import SwiftUI


struct RightView: View {
    @StateObject var countriesVM = CountriesViewModel()
    @State private var isShowingSignupView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(countriesVM.countries) { country in
                    NavigationLink(destination: CountryDetailsView(country: country)) {
                        CountryRow(country: country)
                    }
                }
            }
            .navigationTitle("Countries")
            .listStyle(PlainListStyle())
        }
        .task {
            await countriesVM.getAll()
        }
    }
}

struct RightView_Previews: PreviewProvider {
    static var previews: some View {
        RightView()
    }
}

