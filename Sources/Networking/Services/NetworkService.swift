//
//  NetworkService.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 30.05.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case otherError
}

final class NetworkService: ObservableObject {
    @Published var mainModel: [MainModel] = []
    
    init() {
        fetchData { result in
            switch result {
            case .success(let model):
                self.mainModel = model
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchData(completion: @escaping ((Swift.Result<[MainModel], NetworkError>) -> Void)) {
        
        guard let baseURL = URL(string: "https://rickandmortyapi.com/api/character") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            if let error = error {
                completion(.failure(.otherError))
            return
            }
            
            guard let data = data else {
                completion(.failure(.otherError))
                return
            }
            
            do {
                let model = try JSONDecoder().decode([MainModel].self, from: data)
                return completion(.success(model))
            } catch {
                return completion(.failure(.otherError))
            }
        }.resume()
    }
}

//enum NetworkErrors: Error {
//    case invalidURL
//    case noData
//    case decodingError
//}
//
//enum EndPoints {
//    static let baseURL = "https://rickandmortyapi.com/api/character"
//}
//
//enum HttpMethod: String {
//    case get = "GET"
//    case post = "POST"
//    case put = "PUT"
//    case patch = "PATCH"
//    case delete = "DELETE"
//}
//
//final class NetworkService {
//    private let urlSession: URLSession
//    private let jsonDecoder: JSONDecoder
//    private let jsonEncoder: JSONEncoder
//    
//    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .init(), jsonEncoder: JSONEncoder = .init()) {
//        self.urlSession = urlSession
//        self.jsonDecoder = jsonDecoder
//        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//        self.jsonEncoder = jsonEncoder
//    }
//    
//    func makeRequest<T: Codable>(
//        urlString: String,
//        method: HttpMethod,
//        params: [String: String?],
//        completion: @escaping ((Swift.Result<T, Error>) -> Void)) {
//            
//            guard var urlComponents = URLComponents(string: urlString) else { return }
//            guard let url = urlComponents.url else {
//                NSLog ("Worst URL")
//                return
//            }
//            
//            var request = URLRequest(url: url)
//            request.httpMethod = method.rawValue
//            
//            let task = urlSession.dataTask(with: request) { [jsonDecoder] data, response, error in
//                switch (data, error) {
//                case let (.some(data), nil):
//                    do {
//                        let response = try jsonDecoder.decode(T.self, from: data)
//                        DispatchQueue.main.async {
//                            completion(.success(response))
//                        }
//                    } catch {
//                        completion(.failure(error))
//                    }
//                case let (nil, .some(error)):
//                    completion(.failure(error))
//                default:
//                    completion(.failure(NetworkErrors.invalidURL))
//                }
//            }
//            task.resume()
//        }
//}
