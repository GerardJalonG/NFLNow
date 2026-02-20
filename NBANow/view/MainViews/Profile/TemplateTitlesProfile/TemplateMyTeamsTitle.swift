//
//  profile_row.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 2/2/26.
//

import SwiftUI

struct TemplateMyTeamsTitle: View {
    let title: String
    let showEdit: Bool
    let action: () -> Void

    var body: some View {
        HStack {
            Text(title).bold()
            Spacer()

            Button(action: action) {
                if showEdit {
                    Text("Edit")
                        .fontWeight(.semibold)
                } else {
                    Image(systemName: "plus")
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 8)
    }
}
