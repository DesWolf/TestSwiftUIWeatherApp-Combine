//
//  APIServiceCombine.swift
//  testSwiftUI2
//
//  Created by Max Okuneev on 08.11.2022.
//

//Example APIService with combine

import Foundation
import Combine

public class APIServiceCombine {
    public static let shared = APIServiceCombine()
    var cancellables = Set<AnyCancellable>()

    public enum APIError: Error {
        case error(_ errorString: String)
    }

    func getJSON<T: Decodable>(urlString: String,
                               dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                               keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                               completion:  @escaping (Result<T,APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Error: Invalid URL", comment: ""))))
            return
        }

        let request = URLRequest(url: url)
        let decoder = JSONDecoder()

        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data}
            .decode(type: T.self, decoder: decoder)
            .receive(on: RunLoop.main)
            .sink { taskComplition in
                switch taskComplition {
                case .finished:
                    return
                case .failure(let decodingError):
                    completion(.failure(APIError.error("Error: \(decodingError.localizedDescription)")))
                }
            } receiveValue: { decodedData in
                completion(.success(decodedData))
            }
            .store(in: &cancellables)

//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                completion(.failure(.error("Error: \(error.localizedDescription)")))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.error(NSLocalizedString("Error: Data is corrupt.", comment: ""))))
//                return
//            }
//            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = dateDecodingStrategy
//            decoder.keyDecodingStrategy = keyDecodingStrategy
//            do {
//                let decodedData = try decoder.decode(T.self, from: data)
//                completion(.success(decodedData))
//                return
//            } catch let decodingError {
//                completion(.failure(APIError.error("Error: \(decodingError.localizedDescription)")))
//                return
//            }
//
//        }.resume()
    }
}
