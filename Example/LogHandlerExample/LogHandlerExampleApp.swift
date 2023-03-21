//
//  LogHandlerExampleApp.swift
//  LogHandlerExample
//
//  Created by tdt on 2023/3/21.
//

import SwiftUI
import LogHandler
import Logging

@main
struct LightsLogHandlerExampleApp: App {

    let logger: Logger

    init() {
        LoggingSystem.bootstrap { label in
            LightsLogHandler(label: label, recorder: LogRecorder())
        }

        var logger = Logger(label: "example.home")
        logger[metadataKey: "uuid"] = "\(UUID())"
        logger.logLevel = .debug

        self.logger = logger
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
            .onAppear {
                logger.info("onAppear")
            }
        }
    }
}
