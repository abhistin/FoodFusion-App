//
//  NetworkService.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 06/11/23.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void) {
        request(route: .fetchAllCategories, method: .get, completion: completion)
    } 
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<Order, Error>) -> Void) {
        let params = ["name": name]
        request(route: .placeOrder(dishId), method: .post, parameters: params, completion: completion)
        
    }
    func fetchCategoryDishes(categoryId: String, completion: @escaping (Result<[Dish], Error>) -> Void) {
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    func fetchOrders(completion: @escaping(Result<[Order], Error>) -> Void) {
        request(route: .fetchOrders, method: .get, completion: completion)
    }
    
    /// Creates a network request session to process a given request.
    /// - Parameters:
    ///   - route: A `Route` object that defines the URL and path for the request.
    ///   - method: The HTTP request method (e.g., GET, POST, PUT, DELETE) to be used for the request.
    ///   - parameters: An optional dictionary containing parameters to be included in the request's body or URL query.
    ///   - type: The expected response type conforming to the `Codable` protocol. This type is used to decode the response data into a Swift object.
    ///   - completion: A closure that takes a `Result` enum as a parameter. The `Result` enum can either represent a successful result with a decoded object of type `T`, or an error if the request fails.
    
    private func request<T: Codable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]? = nil,
                                     completion: @escaping (Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data:data, encoding: .utf8) ?? "Could not stringify our data"
                print("The response is:\n\(responseString)")
            }
            else if let error = error {
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                //MARK: - TODO decode the result and send back to user
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data,Error>?,
                                              completion: (Result<T,Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result {
            
        case .success(let data):
             let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            if let decodedData = response.data {
                completion(.success(decodedData))
            }
            else {
                completion(.failure(AppError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    /// Method for creating a urlRequest
    /// - Parameters:
    ///   - route: Path to the backend(url)
    ///   - method: which method to pass(GET,POST,PUT,PATCH)
    ///   - parameters: additional body parameters
    /// - Returns: URLRequest
     private func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asURL else { return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        if let params = parameters {
            switch method {
                
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
