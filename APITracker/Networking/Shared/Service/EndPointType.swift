//
//  EndPointType.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/20/23.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

