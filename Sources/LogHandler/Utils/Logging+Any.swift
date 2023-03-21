//
//  Logging+Any.swift
//  
//
//  Created by tdt on 2023/3/21.
//  Logger.Message -> Any; message() -> "\(message.map { "\($0)" }.joined(separator: " "))"

import Foundation
import Logging

extension Logger {
    /// Log a message passing with the ``Logger/Level/trace`` log level.
    ///
    /// If `.trace` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func trace(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .trace, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func trace(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .trace, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/trace`` log level.
    ///
    /// If `.trace` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func trace(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.trace("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func trace(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.trace("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/debug`` log level.
    ///
    /// If `.debug` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func debug(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .debug, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func debug(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .debug, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/debug`` log level.
    ///
    /// If `.debug` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func debug(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.debug("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func debug(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.debug("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/info`` log level.
    ///
    /// If `.info` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func info(_ message: Any...,
                     metadata: @autoclosure () -> Logger.Metadata? = nil,
                     source: @autoclosure () -> String? = nil,
                     file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .info, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func info(_ message: Any...,
                     metadata: @autoclosure () -> Logger.Metadata? = nil,
                     source: @autoclosure () -> String? = nil,
                     file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .info, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/info`` log level.
    ///
    /// If `.info` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func info(_ message: Any...,
                     metadata: @autoclosure () -> Logger.Metadata? = nil,
                     file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.info("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func info(_ message: Any...,
                     metadata: @autoclosure () -> Logger.Metadata? = nil,
                     file: String = #file, function: String = #function, line: UInt = #line) {
        self.info("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/notice`` log level.
    ///
    /// If `.notice` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func notice(_ message: Any...,
                       metadata: @autoclosure () -> Logger.Metadata? = nil,
                       source: @autoclosure () -> String? = nil,
                       file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .notice, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func notice(_ message: Any...,
                       metadata: @autoclosure () -> Logger.Metadata? = nil,
                       source: @autoclosure () -> String? = nil,
                       file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .notice, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/notice`` log level.
    ///
    /// If `.notice` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func notice(_ message: Any...,
                       metadata: @autoclosure () -> Logger.Metadata? = nil,
                       file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.notice("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func notice(_ message: Any...,
                       metadata: @autoclosure () -> Logger.Metadata? = nil,
                       file: String = #file, function: String = #function, line: UInt = #line) {
        self.notice("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/warning`` log level.
    ///
    /// If `.warning` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func warning(_ message: Any...,
                        metadata: @autoclosure () -> Logger.Metadata? = nil,
                        source: @autoclosure () -> String? = nil,
                        file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .warning, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func warning(_ message: Any...,
                        metadata: @autoclosure () -> Logger.Metadata? = nil,
                        source: @autoclosure () -> String? = nil,
                        file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .warning, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/warning`` log level.
    ///
    /// If `.warning` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func warning(_ message: Any...,
                        metadata: @autoclosure () -> Logger.Metadata? = nil,
                        file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.warning("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func warning(_ message: Any...,
                        metadata: @autoclosure () -> Logger.Metadata? = nil,
                        file: String = #file, function: String = #function, line: UInt = #line) {
        self.warning("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/error`` log level.
    ///
    /// If `.error` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func error(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .error, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func error(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .error, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/error`` log level.
    ///
    /// If `.error` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func error(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.error("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func error(_ message: Any...,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.error("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/critical`` log level.
    ///
    /// `.critical` messages will always be logged.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func critical(_ message: Any...,
                         metadata: @autoclosure () -> Logger.Metadata? = nil,
                         source: @autoclosure () -> String? = nil,
                         file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .critical, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func critical(_ message: Any...,
                         metadata: @autoclosure () -> Logger.Metadata? = nil,
                         source: @autoclosure () -> String? = nil,
                         file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .critical, "\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/critical`` log level.
    ///
    /// `.critical` messages will always be logged.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func critical(_ message: Any...,
                         metadata: @autoclosure () -> Logger.Metadata? = nil,
                         file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.critical("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func critical(_ message: Any...,
                         metadata: @autoclosure () -> Logger.Metadata? = nil,
                         file: String = #file, function: String = #function, line: UInt = #line) {
        self.critical("\(message.map { "\($0)" }.joined(separator: " "))", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif
}

extension Logger {
    /// Log a message passing with the ``Logger/Level/trace`` log level.
    ///
    /// If `.trace` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func trace(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .trace, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func trace(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .trace, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/trace`` log level.
    ///
    /// If `.trace` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func trace(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.trace("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func trace(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.trace("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/debug`` log level.
    ///
    /// If `.debug` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func debug(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .debug, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func debug(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .debug, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/debug`` log level.
    ///
    /// If `.debug` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func debug(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.debug("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func debug(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.debug("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/info`` log level.
    ///
    /// If `.info` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func info(_ message: @autoclosure () -> Any,
                     metadata: @autoclosure () -> Logger.Metadata? = nil,
                     source: @autoclosure () -> String? = nil,
                     file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .info, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func info(_ message: @autoclosure () -> Any,
                     metadata: @autoclosure () -> Logger.Metadata? = nil,
                     source: @autoclosure () -> String? = nil,
                     file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .info, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/info`` log level.
    ///
    /// If `.info` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func info(_ message: @autoclosure () -> Any,
                     metadata: @autoclosure () -> Logger.Metadata? = nil,
                     file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.info("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func info(_ message: @autoclosure () -> Any,
                     metadata: @autoclosure () -> Logger.Metadata? = nil,
                     file: String = #file, function: String = #function, line: UInt = #line) {
        self.info("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/notice`` log level.
    ///
    /// If `.notice` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func notice(_ message: @autoclosure () -> Any,
                       metadata: @autoclosure () -> Logger.Metadata? = nil,
                       source: @autoclosure () -> String? = nil,
                       file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .notice, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func notice(_ message: @autoclosure () -> Any,
                       metadata: @autoclosure () -> Logger.Metadata? = nil,
                       source: @autoclosure () -> String? = nil,
                       file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .notice, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/notice`` log level.
    ///
    /// If `.notice` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func notice(_ message: @autoclosure () -> Any,
                       metadata: @autoclosure () -> Logger.Metadata? = nil,
                       file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.notice("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func notice(_ message: @autoclosure () -> Any,
                       metadata: @autoclosure () -> Logger.Metadata? = nil,
                       file: String = #file, function: String = #function, line: UInt = #line) {
        self.notice("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/warning`` log level.
    ///
    /// If `.warning` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func warning(_ message: @autoclosure () -> Any,
                        metadata: @autoclosure () -> Logger.Metadata? = nil,
                        source: @autoclosure () -> String? = nil,
                        file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .warning, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func warning(_ message: @autoclosure () -> Any,
                        metadata: @autoclosure () -> Logger.Metadata? = nil,
                        source: @autoclosure () -> String? = nil,
                        file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .warning, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/warning`` log level.
    ///
    /// If `.warning` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func warning(_ message: @autoclosure () -> Any,
                        metadata: @autoclosure () -> Logger.Metadata? = nil,
                        file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.warning("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func warning(_ message: @autoclosure () -> Any,
                        metadata: @autoclosure () -> Logger.Metadata? = nil,
                        file: String = #file, function: String = #function, line: UInt = #line) {
        self.warning("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/error`` log level.
    ///
    /// If `.error` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func error(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .error, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func error(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      source: @autoclosure () -> String? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .error, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/error`` log level.
    ///
    /// If `.error` is at least as severe as the `Logger`'s ``logLevel``, it will be logged,
    /// otherwise nothing will happen.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func error(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.error("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func error(_ message: @autoclosure () -> Any,
                      metadata: @autoclosure () -> Logger.Metadata? = nil,
                      file: String = #file, function: String = #function, line: UInt = #line) {
        self.error("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/critical`` log level.
    ///
    /// `.critical` messages will always be logged.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func critical(_ message: @autoclosure () -> Any,
                         metadata: @autoclosure () -> Logger.Metadata? = nil,
                         source: @autoclosure () -> String? = nil,
                         file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.log(level: .critical, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func critical(_ message: @autoclosure () -> Any,
                         metadata: @autoclosure () -> Logger.Metadata? = nil,
                         source: @autoclosure () -> String? = nil,
                         file: String = #file, function: String = #function, line: UInt = #line) {
        self.log(level: .critical, "\(message())", metadata: metadata(), source: source(), file: file, function: function, line: line)
    }
    #endif

    /// Log a message passing with the ``Logger/Level/critical`` log level.
    ///
    /// `.critical` messages will always be logged.
    ///
    /// - parameters:
    ///    - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///    - metadata: One-off metadata to attach to this log message.
    ///    - source: The source this log messages originates from. Defaults
    ///              to the module emitting the log message (on Swift 5.3 or
    ///              newer and the folder name containing the log emitting file on Swift 5.2 or
    ///              older).
    ///    - file: The file this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#fileID` (on Swift 5.3 or newer and `#file` on Swift 5.2 or older).
    ///    - function: The function this log message originates from (there's usually no need to pass it explicitly as
    ///                it defaults to `#function`).
    ///    - line: The line this log message originates from (there's usually no need to pass it explicitly as it
    ///            defaults to `#line`).
    #if compiler(>=5.3)
    @inlinable
    public func critical(_ message: @autoclosure () -> Any,
                         metadata: @autoclosure () -> Logger.Metadata? = nil,
                         file: String = #fileID, function: String = #function, line: UInt = #line) {
        self.critical("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }

    #else
    @inlinable
    public func critical(_ message: @autoclosure () -> Any,
                         metadata: @autoclosure () -> Logger.Metadata? = nil,
                         file: String = #file, function: String = #function, line: UInt = #line) {
        self.critical("\(message())", metadata: metadata(), source: nil, file: file, function: function, line: line)
    }
    #endif
}

