//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by cycu on 2021/5/3.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                CircleImage(image: Image("cat"))
                
                Divider()

                
                Group {
                    Text("Self Introduction:")
                    Text(profile.intro)
                    Text("Notification: \(profile.prefersNotification ? "On" : "off")")
                    Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
                    Text("Birthday: ") + Text(profile.goalDate, style: .date)
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal){
                        HStack{
                            HikeBadge(name: "First Post")
                            HikeBadge(name: "First Liked")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Liked")
                                .grayscale(0.5) //調暗
                                .hueRotation(Angle(degrees: 30))
                        }
                        .padding()
                    }
                }
            }
            .padding()
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
