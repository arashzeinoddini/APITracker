//
//  CountriesEndPoint.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/20/23.
//

import Foundation


public enum CountriesApi {
    case all
}

extension CountriesApi: EndPointType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://restcountries.com/v3.1/")
        else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .all:
            return "all"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .all:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


