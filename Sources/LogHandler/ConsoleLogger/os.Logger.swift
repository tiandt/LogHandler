import Foundation
import OSLog
import os.log

public typealias OSLogger = os.Logger

public extension OSLogger {
    static let loggingSubsystem: String = "DevelopTool"
    static let toolkit: Logger? = Logger(subsystem: Self.loggingSubsystem, category: "toolkit")

    static func export() -> [String] {
        do { 
            let store = try OSLogStore(scope: .currentProcessIdentifier)
            let position = store.position(timeIntervalSinceLatestBoot: 1)
            let logs = try store
                .getEntries(at: position)
                .compactMap { $0 as? OSLogEntryLog }
                .filter { $0.subsystem == Self.loggingSubsystem }
                .map { "[\($0.date.formatted())] [\($0.category)] \($0.composedMessage)" }
            return logs
        } catch {
            return []
        }
    }
}
