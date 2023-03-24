//
//  LogHandlerExampleApp.swift
//  LogHandlerExample
//
//  Created by tdt on 2023/3/21.
//

import SwiftUI
import LogHandler
import Logging
import Combine

extension Logger {

    static let recorder = LogRecorder()
    static var main: Logger!
    static var content: Logger!
    static var cancellable = Set<AnyCancellable>()

    static func initialization() {

        LoggingSystem.bootstrap { label in
            var handler = LightsLogHandler(subsystem: Bundle.main.bundleIdentifier!, category: label, loggers: [.oslog, .print], recorder: recorder)
            handler.separator = " ----\n"
            return handler
        }

        func createLogger(label: String) -> Logging.Logger {
            var logger = Logger(label: label)
            logger[metadataKey: "uuid"] = "\(UUID())"
            logger.logLevel = .trace
            return logger
        }

        main = createLogger(label: "example.main")
        content = createLogger(label: "example.content")
    }

}

@main
struct LightsLogHandlerExampleApp: App {

    init() {
        Logger.initialization()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Logger.main.info("onAppear")
                }
        }
    }
}
