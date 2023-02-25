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
                ForEach(covid19VM.covid19s) { covid19 in
                    NavigationLink(destination: Covid19DetailView(covid19: covid19)) {
                        COVID19Row(covid19: covid19)
                    }
                }
            }
            .navigationTitle("COVID19")
            .listStyle(PlainListStyle())
        }
        .task {
            await covid19VM.getLatestItems()
        }
    }
}

struct LeftView_Previews: PreviewProvider {
    static var previews: some View {
            LeftView()
    }
}
