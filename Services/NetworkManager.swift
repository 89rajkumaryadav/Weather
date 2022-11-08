//
//  NetworkManager.swift
//  Weather (iOS)
//
//  Created by Rajkumar Yadav on 30/12/21.
//

import Foundation
import Combine
import SwiftUI


class NetworkManager{
    
    private init(){}
    
    static let shared = NetworkManager()
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = ""
    
    //Get data with Get Methos
    func getData<T: Decodable>(urlString:String, type:T.Type) -> Future<T, Error> {
        
        return Future<T, Error> { [weak self] promise in
            
            guard let self = self, let url = URL(string: urlString) else{
                
                return promise(.failure(NetworkError.invalidURL))
            }
            
            debugPrint("URL: \(url.absoluteString)")
            
            URLSession.shared.dataTaskPublisher(for: url)
            
            
                .tryMap{(data, respons) -> Data in
             #if DEBUG
                    
                    let json = data.prettyJson ?? "";
                    print("RESPONSE: \(json)")
                    
               #endif
                    guard let httpResponse = respons as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else{
                        throw NetworkError.responseError
                    }
                    
                    
                    
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                } receiveValue: { promise(.success($0))}
                .store(in: &self.cancellables)
            
            
        }
    }
    
    
}


enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}


