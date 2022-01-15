//
//  ModelData.swift
//  Landmarks
//
//  Created by cycu on 2021/3/22.
//

import Foundation
import Combine


        //T為泛型,可不用把所有要用到的類型都打出來
func load<T: Decodable>(_ filename: String) -> T {
    //fatalError() //使不出錯
    let data : Data
    
    //回傳 URL?, 成功: URL, 失敗: nil
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file) //可能丟出例外,則把它包起來
    } catch {
        fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}



//"final"防止被複寫
final class ModelData: ObservableObject { //使程式活起來,不被寫死
    @Published var landmarks : [Landmark] = load("landmarkData.json")
    
    @Published var profile = Profile.default
    
    
    var features: [Landmark] {
        landmarks.filter{ $0.isFeatured }
    }
    
    var categories: [String:[Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    /*
     Dictionary<String, Arrar<Landmark>>
     Dictionary<String, [Landmark]>
     
     陣列表示法
     Arrar<Landmark> === [Landmark]
     
     字典表示法
     [Key:Value] === Dictionary<Key, Value>
     [String:[Landmark]] === Dictionary<String, Arrar<Landmark>>
     */
    
    
}




//Swift陣列宣告的方式: [String]

//guard let 比較 if let

//fatalError() =>為了不要一直出現錯誤警告


/*
func load(filename: String) -> Data? {
    nil
}
        //_ :可省略不打類型名稱
func load2(_ filename: String) -> Data? {
    nil
}

func test() {
    load(filename: "xxx")
    load2("xxx")
}
*/
