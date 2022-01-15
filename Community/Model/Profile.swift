//
//  Profile.swift
//  Landmarks
//
//  Created by cycu on 2021/5/3.
//

import Foundation


struct Profile {
    // instance properties 實例屬性：初始化後才可使用
    var username: String
    var prefersNotification = true  //會直接判別為布林值
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    var intro: String
    
    // static property 靜態屬性：直接以[型別名稱.屬性名稱]存取
    // Profile.default
    static let `default` = Profile(username: "Zac", intro: "No matter what you’re going through, there’s a light at the end ofthe tunnel !")
    
                        //可列舉的型別
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌸"
        case summer = "☀️"
        case autumn = "🍁"
        case winter = "❄️"
        
        var id: String{ self.rawValue }
        
    }
}
