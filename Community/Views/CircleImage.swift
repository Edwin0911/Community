//
//  CircleImage.swift
//  Landmarks
//
//  Created by cycu on 2021/3/15.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image //設變數(小寫),型別(大寫)
    
    
    var body: some View {
        
        image
            .resizable() //填滿邊匡
            .frame(width: 250, height: 250)
//            .offset(x: -10,y: 10) //x位移左右,y位移上下
            .clipShape(Circle()) //將邊邊切成圓
/*
            .overlay( //上面覆蓋東西
                Circle()
                    .stroke(lineWidth: 0) //修改圓形
            )
*/
            .shadow(radius: 10) //陰影,可將邊匡顏色調成白色增加對比
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
