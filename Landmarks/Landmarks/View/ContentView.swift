//
//  ContentView.swift
//  Landmarks
//
//  Created by Аlina Кovtunovich on 03.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       LandmarkList()
            .environmentObject(ModelData())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
