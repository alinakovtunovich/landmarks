//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Аlina Кovtunovich on 07.07.2024.
//

import SwiftUI

struct ProfileEditor: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var profile: Profile
    @Environment(\.presentationMode) var presentationMode
    @State private var draftProfile = Profile.default

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $profile.prefersNotifications) {
                    Text("Enable Notifications")
                }
                HStack {
                    Text("Username")
                    Spacer()
                    TextField("Username", text: $profile.username)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.trailing)
                }
                
                VStack(alignment: .leading) {
                    Text("Seasonal Photo")
                    Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                        ForEach(Profile.Season.allCases) { season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                DatePicker(selection: $profile.goalDate, displayedComponents: .date) {
                    Text("Goal Date")
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        modelData.profile = draftProfile
                        presentationMode.wrappedValue.dismiss()
                    },
                trailing:
                    Button("Save") {
                        draftProfile = modelData.profile
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
}


struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
            .environmentObject(ModelData())
    }
}
