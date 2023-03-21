//
//  LoggerLevel+Extension.swift
//  
//
//  Created by tdt on 2023/3/21.
//

import Logging
import os

extension Logging.Logger.Level {
    var defaultOSLogType: OSLogType {
        switch self {
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
}

extension Logging.Logger.Level {
    var symbol: String {
        switch self {
            case .trace:    return "💚"
            case .debug:    return "💚"
            case .info:     return "💚"
            case .notice:   return "🧡"
            case .warning:  return "❤️"
            case .error:    return "❤️"
            case .critical: return "❤️"
        }
    }
}
