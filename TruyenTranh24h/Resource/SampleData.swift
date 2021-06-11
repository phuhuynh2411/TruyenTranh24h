//
//  Data.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import UIKit
import CarouselView

struct SampleData {
    
    static private var storyFilename = "stories"
    static private var storyMoreFilename = "stories-1"
    static private var localStoryFilename = "local_stories"
    static private var carouselFileName = "carousel"
    static private var categoryFileName = "category"
    static private var searchCategoryFileName = "search_category"
    
    static func stories() -> [Story] {
        var stories = [Story]()
        
        if let asset = NSDataAsset(name: storyFilename) {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            jsonDecoder.dateDecodingStrategy = .iso8601
            
            do{
                try stories = jsonDecoder.decode([Story].self, from: asset.data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Could not find the resource file.\(storyFilename)")
        }
       
        return stories
    }
    
    static func storiesMore() -> [Story] {
        var stories = [Story]()
        
        if let asset = NSDataAsset(name: storyMoreFilename) {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            jsonDecoder.dateDecodingStrategy = .iso8601
            
            do{
                try stories = jsonDecoder.decode([Story].self, from: asset.data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Could not find the resource file.\(storyMoreFilename)")
        }
       
        return stories
    }
    
    static func localStories() -> [Story] {
        var stories = [Story]()

        if let asset = NSDataAsset(name: localStoryFilename) {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do{
                try stories = jsonDecoder.decode([Story].self, from: asset.data)
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

        if let asset = NSDataAsset(name: carouselFileName) {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do{
                try carousels = jsonDecoder.decode([Carousel].self, from: asset.data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Could not find the resource file.\(carouselFileName)")
        }
       
        return carousels
    }
    
    static func categories() -> [Category] {
        var categories = [Category]()

        if let asset = NSDataAsset(name: categoryFileName) {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do{
                try categories = jsonDecoder.decode([Category].self, from: asset.data)
            } catch {
                print("Decode error: " + error.localizedDescription)
            }
        } else {
            print("Could not find the resource file.\(categoryFileName)")
        }
       
        return categories
    }
    
    static func searchCategories() -> [SearchCategory] {
        var categories = [SearchCategory]()

        if let asset = NSDataAsset(name: searchCategoryFileName) {
            // load stories json file
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do{
                try categories = jsonDecoder.decode([SearchCategory].self, from: asset.data)
            } catch {
                print("Decode error: " + error.localizedDescription)
            }
        } else {
            print("Could not find the resource file.\(searchCategoryFileName)")
        }
       
        return categories
    }
}
