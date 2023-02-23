//
//  Le.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/23/23.
//

import SwiftUI

struct LeftView: View {
    @StateObject var covid19VM = COVID19ViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(covid19VM.covid19s) { covid in
                    COVID19Row(covid19: covid)
                }
            }
            .task {
                await covid19VM.getLatestItems()
            }
            .navigationTitle("COVID19")
            .listStyle(PlainListStyle())
        }
    }
}

struct LeftView_Previews: PreviewProvider {
    static var previews: some View {
            LeftView()
    }
}
