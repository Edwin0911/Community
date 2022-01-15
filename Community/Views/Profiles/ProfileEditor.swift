//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by cycu on 2021/5/3.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dataRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    //1...5  -> 1,2,3,4,5
    //1...<5 -> 1,2,3,4
    
    
    var body: some View {
        
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            HStack {
                Text("Self Introduction").bold()
                Divider()
                TextField("Self Introduction", text: $profile.intro)
            }
            
            Toggle(isOn: $profile.prefersNotification, label: {
                Text("Enable Notifications").bold()
            })
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            DatePicker(selection: $profile.goalDate, in: dataRange, displayedComponents: .date) {
                Text("Birth Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(Profile.default))
    }
}
