//
//  COVI19.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/20/23.
//

import Foundation

// MARK: - COVID19
class COVID19: Codable, Identifiable {
    var country: String?
    var moreData: String?
    var historyData: String?
    var sourceURL: String? 
}
