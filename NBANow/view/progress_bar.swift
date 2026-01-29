//
//  progress_bar.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 29/1/26.
//

import SwiftUI

struct progress_bar: View {
    let progress: Double
    let color: Color

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.25))
                    .frame(height: 8)

                Capsule()
                    .fill(color)
                    .frame(
                        width: geo.size.width * CGFloat(min(progress, 1)),
                        height: 8
                    )
            }
        }
        .frame(height: 8)
    }
}

struct progress_bar_Previews: PreviewProvider {
    static var previews: some View {
        progress_bar(progress: 0.2, color: Color(hex: "427D3D"))
            .padding()
    }
}
