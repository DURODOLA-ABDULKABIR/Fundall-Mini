//
//  NetworkService.swift
//  Fundall-Mini-Project
//
//  Created by Decagon on 26.6.21.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    func register(parameters: [String: Any], completion: @escaping(Result<Register, Error>)-> Void) {
        request(route: .register, method: .post, parameters: parameters, completion: completion)
    }
    
    func login(parameters: [String: Any], completion: @escaping(Result<Authentication, Error>)-> Void) {
        request(route: .authenticate, method: .post, parameters: parameters, completion: completion)
    }
    
    private func request<T: Decodable>(route: Route,
                                       method: Method,
                                       parameters: [String: Any]? = nil,
                                       completion: @escaping(Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(NetworingError.unknownError))
            return
        }
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify data"
                print("This is \(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("Error is \(error.localizedDescription )")
            }
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?, completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(NetworingError.unknownError))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(NetworkResponse<T>.self, from: data)
            else {
                completion(.failure(NetworingError.errorDecoding))
                return
            }
            
            if let error = response.error {
                completion(.failure(NetworingError.serverError(error)))
                return
            }
            
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(NetworingError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
            
        }
    }
    
    
     private func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest?
    {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map{(URLQueryItem(name: $0, value: "\($1)"))}
                urlRequest.url = urlComponent?.url
            case .post:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
