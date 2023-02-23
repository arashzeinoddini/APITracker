//
//  NetworkManager.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/20/23.
//

import Foundation

public typealias NetworkManagerCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

class NetworkManager<EndPoint: EndPointType> {
    private var task: URLSessionTask?
    
    func request(_ endPoint: EndPoint, completion: @escaping NetworkManagerCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: endPoint)
            NetworkLogger.log(request: request)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from endPoint: EndPoint) throws -> URLRequest {
        
        var request = URLRequest(url: endPoint.baseURL.appendingPathComponent(endPoint.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = endPoint.httpMethod.rawValue
        do {
            switch endPoint.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters,
                                    let bodyEncoding,
                                    let urlParameters):
                
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
                
            case .requestParametersAndHeaders(let bodyParameters,
                                              let bodyEncoding,
                                              let urlParameters,
                                              let additionalHeaders):
                
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?,
                                         bodyEncoding: ParameterEncoding,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    bodyParameters: bodyParameters, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
}

