//
//  Login.swift
//  Community
//
//  Created by 龔照博 on 2021/5/28.
//

import SwiftUI

extension Color {
    static let oldPrimaryColor = Color(UIColor.systemIndigo)
    static let newPrimaryColor = Color("primaryColor")
}

struct Login: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("Brown")
                        .ignoresSafeArea()
                VStack(alignment: .center) {
                    ZStack {
                        Image("cover_image")
                            .resizable()
                            .scaledToFit()
                        
//                        Text("Listening")
//                            .font(.title)
//                            .bold()
                        
                        Image("listening")
//                            .resizable()
//                            .scaledToFit()
                            .offset( x: 20, y: -40)
                            
                    }
                    Spacer()
                    
                    NavigationLink(destination: Home().navigationBarHidden(true)) {
                        Text("Login")
                            .font(.title)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                            .foregroundColor(.black)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(.brown),Color(.white)]), startPoint: .leading, endPoint: .trailing))    //漸層
                            .cornerRadius(10)
                            .padding(.horizontal, 90)
                        
                    }
                
                }
                .offset(y:-25)
                
                
            }
            
        }
//        .navigationBarHidden(true)
//        .background(Color.gray)

    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
