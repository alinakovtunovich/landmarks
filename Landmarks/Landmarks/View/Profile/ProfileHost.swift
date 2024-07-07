//
//  ModelData.swift
//  Landmarks
//
//  Created by Аlina Кovtunovich on 03.07.2024.
//

import SwiftUI

struct ProfileHost: View {
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                ProfileSummary(profile: modelData.profile)
                    .toolbar {
                        ToolbarItem(placement: .automatic) {
                            Button("Edit") {
                                isEditing = true
                            }
                        }
                    }
            }
            .sheet(isPresented: $isEditing) {
                ProfileEditor(profile: $modelData.profile)
            }
            .navigationTitle("Profile")
        }
    }
}


struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
