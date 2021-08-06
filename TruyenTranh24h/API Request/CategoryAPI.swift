//
//  CategoryAPI.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 05/08/2021.
//

import Foundation
import Combine

class CategoryAPI: API {
    static let shared = CategoryAPI()
    
    private func buildRequest(url: URL, limit: Int? = 6) -> URLRequest {
        let urlWithParas = addQueryItems(limit: limit, to: url)
        let request = getRequest(url: urlWithParas)
        
        return request
    }
    
    private func getCategories(url: URL, limit: Int? = nil) -> AnyPublisher<Entry<ResponseData>, Error> {
        let request =  buildRequest(url: url, limit: limit)
        
        return self.send(request: request)
            .eraseToAnyPublisher()
    }
    
    func getCategories() -> AnyPublisher<[Category], Error> {
        return getCategories(url: URLSetting.categoryURL, limit: 100)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    internal func validate(entry: Entry<ResponseData>) throws -> [Category] {
        return entry.data?.data ?? []
    }
    
    // MARK: - ResponseData
    struct ResponseData: Codable {
        let data: [Category]
    }
}
