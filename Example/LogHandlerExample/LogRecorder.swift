//
//  LogRecorder.swift
//  LogHandlerExample
//
//  Created by tdt on 2023/3/20.
//

import LogHandler

class LogRecorder: LogRecorderProtocol {

    var lines: [String] = []

    func recorde(message: String) {
        lines.append(message)
    }

    func clear() {
        lines = []
    }
}
