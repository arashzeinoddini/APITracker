//
//  CountriesNetworkManager.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/20/23.
//


import Foundation

struct CountriesNetworkManager {
    let networkManager = NetworkManager<CountriesApi>()
    
    func getAll(completion: @escaping (_ countries: [Country]?,_ error: String?)->()){
        networkManager.request(.all) { data, response, error in
            
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
                        let apiResponse = try JSONDecoder().decode([Country].self, from: responseData)
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
    
    func getAll() async throws -> [Country]? {
        await withUnsafeContinuation{ continuation in
            getAll(completion: { countries, error in
                continuation.resume(returning: countries)
            })
        }
    }
    
}
