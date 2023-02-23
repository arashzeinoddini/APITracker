//
//  COVID19EndPoint.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/20/23.
//


import Foundation

public enum COVID19Api {
    case latestItems
}

extension COVID19Api: EndPointType {
    
    var token: String {
        return "apify_api_71X8wbwveUqBAL0004Dy3fUkqUlvCy0YKp2r"
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.apify.com/v2/acts/petrpatek~covid-19-aggregator/")
        else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .latestItems:
            return "runs/last/dataset/items"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .latestItems:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["token":token])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


