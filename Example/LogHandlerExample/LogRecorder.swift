//
//  LogRecorder.swift
//  LogHandlerExample
//
//  Created by tdt on 2023/3/20.
//

import LogHandler

class LogRecorder: LogRecorderProtocol {

    var lines: [String] = []

    func write(_ string: String) {
        lines.append(string)
    }

    func clear() {
        lines = []
    }
}

