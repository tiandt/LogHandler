//
//  DTLogHandler.swift
//
//
//  Created by tdt on 2023/3/20.
//
//  Fork From https://github.com/jnross/Bluetility/blob/a50be00a546992971f4d1d74f60c320b84960f3d/Bluetility/BluetilityLogHandler.swift

import Foundation
import Logging
import struct Logging.Logger
import os

public struct DTLogHandler: LogHandler {

    public var logLevel: Logger.Level = .info
    public var oslogLevelTransformer: ((Logging.Logger.Level) -> OSLogType) = oslogTransformer
    public var separator: String = " "
    public var terminator: String = "\n"

    private let subsystem: String
    private let category: String
    private let loggers: [LoggerType]
    private let oslogger: os.Logger
    private let recorder: LogRecorderProtocol?
    private let dateFormatter = DateFormatter()

    public init(subsystem: String, category: String, loggers: [LoggerType] = [.oslog]) {
        self.subsystem = subsystem
        self.category = category
        self.loggers = loggers
        self.oslogger = os.Logger(subsystem: subsystem, category: category)
        self.recorder = nil
        initialization()
    }

    public init(subsystem: String, category: String, loggers: [LoggerType] = [.oslog], recorder: LogRecorderProtocol) {
        self.subsystem = subsystem
        self.category = category
        self.loggers = loggers
        self.oslogger = os.Logger(subsystem: subsystem, category: category)
        self.recorder = recorder
        initialization()
    }

    public init(subsystem: String, category: String, loggers: [LoggerType] = [.oslog], logger: os.Logger, recorder: LogRecorderProtocol) {
        self.subsystem = subsystem
        self.category = category
        self.loggers = loggers
        self.oslogger = logger
        self.recorder = recorder
        initialization()
    }

    private func initialization() {
        dateFormatter.isLenient = true
        /*  https://developer.apple.com/library/archive/qa/qa1480/_index.html
         On the other hand, if you're working with fixed-format dates, you should first set the locale of the date formatter to something appropriate for your fixed format. In most cases the best locale to choose is "en_US_POSIX", a locale that's specifically designed to yield US English results regardless of both user and system preferences. "en_US_POSIX" is also invariant in time (if the US, at some point in the future, changes the way it formats dates, "en_US" will change to reflect the new behaviour, but "en_US_POSIX" will not), and between machines ("en_US_POSIX" works the same on iOS as it does on OS X, and as it it does on other platforms).
         */
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSZ"
    }

    public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, file: String, function: String, line: UInt) {
        var combinedPrettyMetadata: String?

        if let metadataOverride = metadata, !metadataOverride.isEmpty {
            combinedPrettyMetadata = self.prettify(
                self.metadata.merging(metadataOverride) {
                    return $1
                }
            )
        } else {
            combinedPrettyMetadata = self.prettyMetadata
        }

        var output = message.description

        /* oslogger will not print metadata.

        https://github.com/apple/swift-log/issues/208

         If you need log privacy, then I would encourage this strategy in your logging backend:

         -   by default print only the `message` and the metadata *keys*, hide all metadata *values* (because they may contain private data)
         -   for certain fields that you know have no private info, show them. Basically have an allow list of keys you know are fine to print, redact all other metadata values
         -   make sure that only static data is provided in the actual log message

         OSLog's API assumes that every piece of software can always tell whether something is private or not. But that's difficult to tell. For example in most cases a URL for a HTTP library is not private data. But in certain cases it may be. That's why I'd encourage you to use the above way.

         The reason that SwiftLog encourages to put all variable data in the metadata has a couple of reasons:

         -   privacy controls (as described above)
         -   filtering in log aggregation systems, you can just filter by the log message
         */
        if loggers.contains(.oslog) {
            oslogger.log(level: self.oslogLevelTransformer(level), "\(output)")
        }

        if let combinedPrettyMetadata {
            output += terminator + combinedPrettyMetadata
        }

        if loggers.contains(.print) {


            print("\(dateFormatter.string(from: Date())) \(level.symbol) [\(category)] [\(level)] \(file.components(separatedBy: "/").last!):\(line)\(separator)\(output)")
        }

        recorder?.write(output)
    }

    private var prettyMetadata: String?
    public var metadata = Logger.Metadata() {
        didSet {
            self.prettyMetadata = self.prettify(self.metadata)
        }
    }

    /// Add, remove, or change the logging metadata.
    /// - parameters:
    ///    - metadataKey: the key for the metadata item.
    public subscript(metadataKey metadataKey: String) -> Logger.Metadata.Value? {
        get {
            return self.metadata[metadataKey]
        }
        set {
            self.metadata[metadataKey] = newValue
        }
    }

    internal func prettify(_ metadata: Logger.Metadata) -> String? {
        if metadata.isEmpty {
            return nil
        }
        return metadata.map {
            "\($0)=\($1)"
        }.joined(separator: " ")
    }
}

public extension DTLogHandler {
    enum LoggerType {
        case print
        case oslog
    }
}


