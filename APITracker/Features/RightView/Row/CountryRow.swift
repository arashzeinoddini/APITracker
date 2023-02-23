//
//  CountryRow.swift
//  APITracker
//
//  Created by Arash Zeinoddini on 2/23/23.
//

import SwiftUI

struct CountryRow: View {
    var country: Country?
    var body: some View {
        HStack {
            Text(country?.name?.common ?? "Country")
            Spacer()
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow()
    }
}
