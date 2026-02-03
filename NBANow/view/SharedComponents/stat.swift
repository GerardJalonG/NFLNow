//
//  stat.swift
//  NBANow
//
//  Created by alumne on 26/01/2026.
//

import SwiftUI

struct stat: View {
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
        stat(key: "PUNTOS" , value: "89")
    }
}

func decimal_to_string(_ stat: Double?) -> String {
    let value = stat ?? 0
    return String(format: "%.2f", value)
}

