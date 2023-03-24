//
//  Logger+TextOutputStream.swift
//  LogHandlerExample
//
//  Created by tdt on 2023/3/24.
//

import Foundation
import Logging

extension Logger: TextOutputStream {
    public func write(_ string: String) {
        log(level: .debug, .init(stringLiteral: "\(string)"))
    }
}
