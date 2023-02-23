//
//  Country.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/21/23.
//

import Foundation

// MARK: - Country
class Country: Codable, Identifiable {
    var name: Name?
    var flag: String?
    var population: Int?
}

// MARK: - Name
class Name: Codable {
    var common: String?
    var official: String?
}
