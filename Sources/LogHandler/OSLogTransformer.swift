//
//  OSLogTransformer.swift
//
//
//  Created by tdt on 2023/3/20.
//  https://developer.apple.com/documentation/os/logging/generating_log_messages_from_your_code
//  In the console app, there are two options to include / hide debug and info messages:
//  https://stackoverflow.com/a/66948803

import Foundation
import os
import struct Logging.Logger

func oslogTransformer(loggerLevel: Logging.Logger.Level) -> OSLogType {
    switch loggerLevel {
        case .trace:
            return .debug // will not show in console
        case .debug:
            return .info // show in console when `include info messages` selected
        case .info:
            return .default
        case .notice:
            return .default
        case .warning:
            return .error
        case .error:
            return .error
        case .critical:
            return .fault
    }
}
