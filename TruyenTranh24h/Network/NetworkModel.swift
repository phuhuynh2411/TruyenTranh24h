//
//  NetworkModel.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 28/04/2021.
//

import Foundation
import Combine

protocol NetworkModel {
    associatedtype ResponseData: Codable
    var entry: Entry<ResponseData>? { get set }
    var publisher: APISessionDataPublisher { get set }
    var accessToken: String? { get set }
}

extension NetworkModel {
    
    var defaultHeaders: [String: String] {[
        "Content-Type": "application/json",
        "cache-control": "no-cache",
        ]}
    
    var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
           
    func postRequest(url: URL, authen: Bool = false) -> URLRequest {
        var request = self.request(url: url, authen: authen)
        request.httpMethod = "POST"
        return request
    }
    
    func getRequest(url: URL, authen: Bool = false) -> URLRequest {
        var request = self.request(url: url, authen: authen)
        request.httpMethod = "GET"
        return request
    }
    
    func putRequest(url: URL, authen: Bool = false) -> URLRequest {
        var request = self.request(url: url, authen: authen)
        request.httpMethod = "PUT"
        return request
    }
    
    private func request(url: URL, authen: Bool = false, headers: [String: String]? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = (headers != nil) ? headers : self.defaultHeaders
        if authen, let accessToken = self.accessToken {
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        return request
    }

    func printJSON(data: Data?) {
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print(dataString)
        }
    }
    
    func validate(_ data: Data, _ response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else { throw APIError.invalidRespond }
        
        guard httpResponse.statusCode != 401 else {
            NotificationCenter.default.post(name: .statusCode401, object: self)
            throw APIError.statusCode(httpResponse.statusCode)
        }
        self.printJSON(data: data)
        return data
    }
    
    func send(request: URLRequest) -> AnyPublisher<Entry<ResponseData>, Error> {
        return publisher
            .dataTaskPublisher(for: request)
            .tryMap { try self.validate($0.data, $0.response) }
            .decode(type: Entry<ResponseData>.self, decoder: self.jsonDecoder )
            .eraseToAnyPublisher()
    }
    
    func send<T: Codable>(request: URLRequest) -> AnyPublisher<T, Error> {
        return publisher
            .dataTaskPublisher(for: request)
            .tryMap { try self.validate($0.data, $0.response) }
            .decode(type: T.self, decoder: self.jsonDecoder )
            .eraseToAnyPublisher()
    }
    
    func getData(from url: URL, page: Int? = nil, numberOfItems: Int? = nil, keyword: String? = nil) -> AnyPublisher<Entry<ResponseData>, Error> {
        // Create a URL with parameters
        let url = self.parasWith(url: url, page: page, numberOfItems: numberOfItems, keyword: keyword)
        // Create a get request
        let request = self.getRequest(url: url, authen: true)
        return send(request: request)
    }
    
    private func parasWith(url: URL, page: Int? = nil, numberOfItems: Int? = nil, keyword: String? = nil) -> URL {
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponent.queryItems = []
        if let page = page {
            urlComponent.queryItems?.append(URLQueryItem(name: "page", value: "\(page)"))
        }
        if let numberOfItems = numberOfItems {
            urlComponent.queryItems?.append(URLQueryItem(name: "limit", value: "\(numberOfItems)") )
        }
        if let keyword = keyword {
            urlComponent.queryItems?.append(URLQueryItem(name: "keyword", value: "\(keyword)") )
        }
        
        return urlComponent.url!
    }
    
}
