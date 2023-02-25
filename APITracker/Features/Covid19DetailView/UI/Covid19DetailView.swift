//
//  Covid19DetailView.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/25/23.
//

import SwiftUI

struct Covid19DetailView: View {
    var covid19 : COVID19?
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("Country").font(.headline)
                    Text(covid19?.country ?? "N/A")
                }
                HStack {
                    Text("More Data").font(.headline)
                    Text(covid19?.moreData ?? "N/A")
                }
                HStack {
                    Text("History Data").font(.headline)
                    Text(covid19?.historyData ?? "N/A")
                }
                HStack {
                    Text("Source URL").font(.headline)
                    Text(covid19?.sourceURL ?? "N/A")
                }
            }
        }
        .navigationTitle("COVID19 Details")
    }
}

struct Covid19DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Covid19DetailView()
    }
}
