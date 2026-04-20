import Foundation

enum ScreenshotScene: String {
    case home
    case calendar
    case profile
    case teamInfo
    case addTeam
}

enum ScreenshotConfiguration {
    static var isEnabled: Bool {
        ProcessInfo.processInfo.arguments.contains("--screenshot-mode")
    }

    static var scene: ScreenshotScene {
        let arguments = ProcessInfo.processInfo.arguments
        guard let index = arguments.firstIndex(of: "--screenshot-scene"),
              arguments.indices.contains(arguments.index(after: index)) else {
            return .home
        }

        let value = arguments[arguments.index(after: index)]
        return ScreenshotScene(rawValue: value) ?? .home
    }
}
