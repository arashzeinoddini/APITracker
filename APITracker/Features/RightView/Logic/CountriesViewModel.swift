//
//  CountriesViewModel.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/23/23.
//

import Foundation
@MainActor
class CountriesViewModel: ObservableObject {
    
    @Published var countries: [Country] = []
    
    func getAll() async {
        guard let data = try?  await  CountriesNetworkManager().getAll() else {
            self.countries = []
            return
        }
        self.countries = data
    }
}
