//
//  COVID19ViewMoel.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/23/23.
//
import Foundation

@MainActor
class COVID19ViewModel: ObservableObject {
    
    @Published var covid19s: [COVID19] = []

    func getLatestItems() async {
        guard let data = try?  await  COVID19NetworkManager().getLatestItems() else {
            self.covid19s = []
            return
        }
        self.covid19s = data
    }
}
