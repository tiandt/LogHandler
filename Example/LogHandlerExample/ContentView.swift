//
//  ContentView.swift
//  LogHandlerExample
//
//  Created by tdt on 2023/3/21.
//

import SwiftUI
import Logging

struct ContentView: View {

    let logger: Logger

    init() {
        var logger = Logger(label: "example.content")
        logger[metadataKey: "uuid"] = "\(UUID())"
        logger.logLevel = .trace
        self.logger = logger
    }

    var body: some View {
        Form {

            Button {
                logger.trace("trace")
            } label: {
                Text("trace")
            }

            Button {
                logger.debug("critical")
            } label: {
                Text("debug")
            }

            Button {
                logger.info("info")
            } label: {
                Text("info")
            }

            Button {
                logger.notice("notice")
            } label: {
                Text("notice")
            }

            Button {
                logger.warning("warning")
            } label: {
                Text("warning")
            }

            Button {
                logger.error("error")
            } label: {
                Text("error")
            }

            Button {
                logger.critical("critical")
            } label: {
                Text("critical")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
