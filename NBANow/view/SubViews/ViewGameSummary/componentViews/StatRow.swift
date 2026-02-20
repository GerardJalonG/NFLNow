import SwiftUI

struct StatRow: View {

    let statAbbr: String
    let teamAValue: String?
    let teamBValue: String?

    var body: some View {
        HStack(spacing: UI.Sizes.large) {

            Text(teamAValue ?? "-")
                .font(.body)
                .fontWeight(weightForTeamA(teamAValue, teamBValue))
                .frame(width: 70, alignment: .leading)

            Text(statAbbr)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .center)

            Text(teamBValue ?? "-")
                .font(.body)
                .fontWeight(weightForTeamB(teamAValue, teamBValue))
                .frame(width: 70, alignment: .trailing)
        }
    }


    private func weightForTeamA(_ a: String?, _ b: String?) -> Font.Weight {
        let aNum = statNumber(a)
        let bNum = statNumber(b)
        return aNum > bNum ? .semibold : .regular
    }

    private func weightForTeamB(_ a: String?, _ b: String?) -> Font.Weight {
        let aNum = statNumber(a)
        let bNum = statNumber(b)
        return bNum > aNum ? .semibold : .regular
    }

    private func statNumber(_ text: String?) -> Double {
        guard let text else { return 0 }

        let cleaned = text.replacingOccurrences(of: ",", with: ".")
        var number = ""

        for ch in cleaned {
            if ch.isNumber || ch == "." {
                number.append(ch)
            } else if !number.isEmpty {
                break
            }
        }
        return Double(number) ?? 0
    }
}
