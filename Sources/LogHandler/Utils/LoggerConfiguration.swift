//
//  Handler.swift
//
//
//  Created by tdt on 2024/1/10.
//

import Foundation

public class LoggerConfiguration { }

extension LoggerConfiguration {
#if CONSOLE_PRINT || STUDIO_PRINT
    public static var minimumLogLevel: LogLevel = .debug
#endif
}

extension LoggerConfiguration {

    public static var separator: String = "\n"
    public static var terminator: String = "\n"

    public typealias File = String
    public typealias Function = String
    public typealias Line = Int
    public typealias Column = Int
    public typealias Separator = String
    public typealias Terminator = String

    static var prefix: (File, Function, Line, Column) -> (String) = { file, function, line, column in
#if CONSOLE_PRINT || STUDIO_PRINT
        "\(file.components(separatedBy: "/").last!):\(line) :\(function)"
#else
        ""
#endif
    }

    public static var handler: (Separator, Terminator, File, Function, Line, Column, [Any]) -> (String) = { separator, terminator, file, function, line, column, items in

        var messages = ""
        for message in items {
            messages = messages.isEmpty ? "\(message)" : "\(messages)\(separator)\(message)"
        }

        let prefix = prefix(file, function, line, column)
        if prefix.isEmpty == false {
            messages = "\(prefix)\(separator)\(messages)\(terminator)"
        } else {
            messages = "\(messages)\(terminator)"
        }

        return messages
    }
}

