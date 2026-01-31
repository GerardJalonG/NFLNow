//
//  GameStatsHelpers.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 31/1/26.
//

extension String {
    func toDouble() -> Double {
        Double(self) ?? 0
    }
}

extension Totals {

    func lastValue() -> String? {

        if let value = eightData { return value }
        if let value = seventhData { return value }
        if let value = sixthData { return value }
        if let value = fifthData { return value }
        if let value = fourthData { return value }
        if let value = thirdData { return value }
        if let value = secondData { return value }
        if let value = firstData { return value }

        return nil
    }
}

extension Labels {

    func lastLabel() -> String? {

        if let value = eightData { return value }
        if let value = seventhData { return value }
        if let value = sixthData { return value }
        if let value = fifthData { return value }
        if let value = fourthData { return value }
        if let value = thirdData { return value }
        if let value = secondData { return value }
        if let value = firstData { return value }

        return nil
    }
}

extension StatisticsPlayer {
    func lastTotal() -> (label: String, value: Double) {
        let label = labels.first?.lastLabel() ?? "-"
        let value = totals.first?.lastValue()?.toDouble() ?? 0

        return (label, value)
    }
}

extension boxScore {
    func lastTotalForTeam(
        teamId: String,
        statName: String
    ) -> (label: String, value: Double)? {
        let teamStats = players.first { $0.team.id == teamId }
        let stat = teamStats?.statistics.first { $0.name == statName }

        return stat?.lastTotal()
    }
}
