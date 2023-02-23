//
//  ContentView.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LeftView()
                .tabItem {
                    Label("COVID19", systemImage: "allergens")
                }
            RightView()
                .tabItem {
                    Label("Countries", systemImage: "network")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
