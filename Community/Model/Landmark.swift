//
//  Landmark.swift
//  Landmarks
//
//  Created by cycu on 2021/3/22.
//

import Foundation
import SwiftUI
import CoreLocation
                    //繼承,可編解碼,可被識別的(ID):可省略"id: \.id(KeyPath)"
struct Landmark:Hashable, Codable, Identifiable {
    //stored property 儲存型屬性
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool //增加我的最愛功能
    var isFeatured: Bool
    
    
    var category:  Category
    enum Category: String, CaseIterable, Codable {  //Codable:可傳回JSON
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    
    
    //internal, private, public, open
    //from JSON
    private var imageName:String
    
    //computed property 計算型屬性
    //for UI
    var image: Image {
        Image(imageName)
    }
    
    //from JSON
    private var coordinates: Coordinates
    //for UI
    var locationCoordinates: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var longitude: Double
        var latitude: Double
        
        
    }
    
}







/*
 JSON ->資料表達的一種格式
 物件: {}
 陣列: []
 屬性: "propName"
 值: "string", 123, true, false
 
 */
