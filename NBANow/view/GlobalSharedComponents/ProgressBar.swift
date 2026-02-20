//
//  progress_bar.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 29/1/26.
//

import SwiftUI

struct ProgressBar: View {
    let progress: Double
    let color: Color

    private let maxWidth: CGFloat = 350

    var body: some View {
        
        ZStack(alignment: .leading) {

            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.25))
                .frame(width: maxWidth, height: 8)
            
            RoundedRectangle(cornerRadius: 4)
                .fill(color)
                .frame(
                    width: maxWidth * CGFloat(min(progress, 1.0)),
                    height: 8
                )
        }
    }
}

struct progress_bar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 0.2, color: Color(hex: "427D3D"))
            .padding()
    }
}
