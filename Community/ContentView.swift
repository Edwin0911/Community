//
//  ContentView.swift
//  Community
//
//  Created by Edwin on 2021/5/11.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                ZStack {
                    Image("cover_image")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Listening")
                        .font(.title)
                        .bold()
                        
                }
                Spacer()
                
                NavigationLink(destination: Home()) {
                    Text("Log In")
                        .font(.title)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(.brown),Color(.white)]), startPoint: .leading, endPoint: .trailing))    //漸層
                        .cornerRadius(10)
                        .padding(.horizontal, 90)
                    
                }
            
            }
            .offset(y:-30)
            //.ignoresSafeArea()
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
