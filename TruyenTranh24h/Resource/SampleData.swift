//
//  Data.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import Foundation
import CarouselView

struct SampleData {
    
    static var storyFilename = "stories"
    static var localStoryFilename = "local_stories"
    static var carouselFileName = "carousel"
    
    static func stories() -> [Story] {
        var stories = [Story]()

        if let url = Bundle.main.url(forResource: storyFilename, withExtension: ".json") {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do{
                try stories = jsonDecoder.decode([Story].self, from: Data(contentsOf: url))
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Could not find the resource file.\(storyFilename)")
        }
       
        return stories
    }
    
    static func localStories() -> [Story] {
        var stories = [Story]()

        if let url = Bundle.main.url(forResource: localStoryFilename, withExtension: ".json") {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do{
                try stories = jsonDecoder.decode([Story].self, from: Data(contentsOf: url))
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Could not find the resource file.\(localStoryFilename)")
        }
       
        return stories
    }
    
    static func carousels() -> [Carousel] {
        var carousels = [Carousel]()

        if let url = Bundle.main.url(forResource: carouselFileName, withExtension: ".json") {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do{
                try carousels = jsonDecoder.decode([Carousel].self, from: Data(contentsOf: url))
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Could not find the resource file.\(carouselFileName)")
        }
       
        return carousels
    }
}
