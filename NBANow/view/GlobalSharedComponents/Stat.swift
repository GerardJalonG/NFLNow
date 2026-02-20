//
//  stat.swift
//  NBANow
//
//  Created by alumne on 26/01/2026.
//

import SwiftUI

struct Stat: View {
    let key: String
    let value: String
    var body: some View {
        HStack {
            Text("\(key): ").fontWeight(.light)
            Text(value).fontWeight(.semibold)
            
        }.font(.subheadline)
    }
}

struct stat_Previews: PreviewProvider {
    static var previews: some View {
        Stat(key: "Points" , value: "89")
    }
}

func decimal_to_string(_ stat: Double?) -> String {
    guard let value = stat else { return "-" }
    return String(format: "%.2f", value)
}

