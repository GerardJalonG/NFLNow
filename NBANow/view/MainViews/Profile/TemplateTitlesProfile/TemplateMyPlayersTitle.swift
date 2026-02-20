//
//  player_profile_row.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import SwiftUI

struct TemplateMyPlayersTitle: View {

    let title: String
    let showEdit: Bool
    let onEdit: () -> Void
    let onAdd: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)

            Spacer()

            if showEdit {
                Button(action: {
                    onEdit()
                }) {
                    Text("Edit")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding(.trailing, 8)
            }

            Button(action: {
                onAdd()
            }) {
                Image(systemName: "plus")
                    .font(.headline)
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 8)
    }
}
