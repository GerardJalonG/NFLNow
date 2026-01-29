//
//  Utilities.swift
//  NBANow
//
//  Created by alumne on 26/01/2026.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)

        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(.sRGB, red: r, green: g, blue: b, opacity: opacity)
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

func randomGameDate() -> Date? {
    let calendar = Calendar.current

    let allowedMonths = [7, 8, 9, 10, 11, 12, 1, 2]
    let month = allowedMonths.randomElement()!

    let year = month <= 2 ? 2026 : 2025
    let day = Int.random(in: 1...28)

    return calendar.date(
        from: DateComponents(
            year: year,
            month: month,
            day: day
        )
    )
}

func randomOpponentTeam(from teams: [Team], currentTeam: Team) -> Team {
    let filteredTeams = teams.filter { $0.id != currentTeam.id }
    return filteredTeams.randomElement()!
}

struct ProgressBar: View {
    let progress: Double
    let color: Color

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.gray.opacity(0.25))
                .frame(height: 8)

            RoundedRectangle(cornerRadius: 6)
                .fill(color)
                .frame(
                    width: max(0, min(progress, 1)) * 200,
                    height: 8
                )
        }
    }
}

func dateToString(_ date: Date?) -> String {
    guard let date = date else { return "-" }
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yyyy"
    return formatter.string(from: date)
}
