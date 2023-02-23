//
//  COVID19Row.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/23/23.
//

import SwiftUI

struct COVID19Row: View {
    var covid19: COVID19?
    var body: some View {
        HStack {
            Text(covid19?.country ?? "COVID19")
            Spacer()
        }
    }
}

struct COVID19Row_Previews: PreviewProvider {
    static var previews: some View {
        COVID19Row()
    }
}
