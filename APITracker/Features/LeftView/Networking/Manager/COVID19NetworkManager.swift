//
//  COVID19NetworkManager.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/20/23.
//


import Foundation

struct COVID19NetworkManager {
    let networkManager = NetworkManager<COVID19Api>()
    
    func getLatestItems(completion: @escaping (_ covid19s: [COVID19]?,_ error: String?)->()){
        networkManager.request(.latestItems) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = NetworkStatusCode.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode([COVID19].self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getLatestItems() async throws -> [COVID19]? {
        await withUnsafeContinuation{ continuation in
            getLatestItems(completion: { covid19s, error in
                continuation.resume(returning: covid19s)
            })
        }
    }
}
