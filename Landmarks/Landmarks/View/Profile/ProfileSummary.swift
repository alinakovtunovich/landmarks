//
//  ModelData.swift
//  Landmarks
//
//  Created by Аlina Кovtunovich on 03.07.2024.
//


import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            Text(profile.username)
                .bold()
                .font(.title)
            Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
            Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            Divider()
            Text("Complted Badges")
                .font(.headline)
            ScrollView {
                HStack {
                    HikeBadge(name: "First Hike")
                    HikeBadge(name: "Earth Day")
                        .hueRotation(Angle(degrees: 90))
                    HikeBadge(name: "Tenth Hike")
                        .grayscale(0.5)
                        .hueRotation(Angle(degrees: 45))
                }
                .padding(.bottom)
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: .default)
            .environmentObject(ModelData())
    }
}

