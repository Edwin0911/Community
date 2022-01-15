//
//  ProfileHost.swift
//  Landmarks
//
//  Created by cycu on 2021/5/3.
//

import SwiftUI

// ProfileHost
// -- ProfileSummary
//  -- Profile (struct)

struct ProfileHost: View {
    @Environment(\.editMode) var editMode  //使其編輯
    @EnvironmentObject var modelData: ModelData
    
    //@State：使其連動
    @State private var draftProfile = Profile.default
    
    var body: some View {
        
        VStack {
            HStack {
                if editMode?.wrappedValue == .active{
                    //按鈕有兩種寫法,這種寫法無法放圖片
                    Button("Cancel"){ //放棄現有資料,還原成原來的狀態
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()  //內建的按鈕
            }
            
            //使其編輯完要按完成才會儲存,否則變回原來的預設
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modelData.profile)
            } else{
                ProfileEditor(profile: $draftProfile) //先暫存
                    .onAppear(){
                        draftProfile = modelData.profile
                    }
                    .onDisappear(){
                        modelData.profile = draftProfile
                    }
                
            }
                
            /*
             以上還沒真正儲存進手機的記憶體,都只是暫存
             */
                
                
        }
        .padding()
        .navigationBarHidden(true)
    }
    
}



struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}

