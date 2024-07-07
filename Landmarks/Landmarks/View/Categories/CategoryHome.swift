//
//  ModelData.swift
//  Landmarks
//
//  Created by Аlina Кovtunovich on 03.07.2024.
//


import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[safe: 0]?.image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarBackButtonHidden(true)
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    NavigationLink(destination: {
                        ProfileHost()
                    }, label: {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(Color.gray)
                    })
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
    CategoryHome()
        .environmentObject(ModelData())
}
}

