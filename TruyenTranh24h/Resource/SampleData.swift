//
//  Data.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import Foundation

struct SampleData {
    static func stories() -> [Story] {
        var stories = [Story]()

        if let url = Bundle.main.url(forResource: "stories", withExtension: ".json") {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do{
                try stories = jsonDecoder.decode([Story].self, from: Data(contentsOf: url))
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Could not find the resource file.")
        }
       
        return stories
    }
}
