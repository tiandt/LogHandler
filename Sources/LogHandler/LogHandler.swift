//
//  LogHandler.swift
//
//
//  Created by tdt on 2023/3/20.
//
//  Fork From https://github.com/jnross/Bluetility/blob/a50be00a546992971f4d1d74f60c320b84960f3d/Bluetility/BluetilityLogHandler.swift

import Foundation
import Logging
import struct Logging.Logger
import os

public struct LightsLogHandler: LogHandler {

    public var logLevel: Logger.Level = .info
    public var oslogLevelTransformer: ((Logging.Logger.Level) -> OSLogType) = oslogTransformer

    private let label: String
    private let oslogger: os.Logger
    private let recorder: LogRecorderProtocol?
    private let dateFormatter = DateFormatter()

    public init(label: String) {
        self.label = label
        self.oslogger = os.Logger(subsystem: label, category: label)
        self.recorder = nil
        initialization()
    }

    public init(label: String, recorder: LogRecorderProtocol) {
        self.label = label
        self.oslogger = os.Logger(subsystem: label, category: label)
        self.recorder = recorder
        initialization()
    }

    public init(label: String, logger: os.Logger, recorder: LogRecorderProtocol) {
        self.label = label
        self.oslogger = logger
        self.recorder = recorder
        initialization()
    }

    private func initialization() {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        dateFormatter.isLenient = true
    }

    public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, file: String, function: String, line: UInt) {
        var combinedPrettyMetadata = self.prettyMetadata
        if let metadataOverride = metadata, !metadataOverride.isEmpty {
            combinedPrettyMetadata = self.prettify(
                self.metadata.merging(metadataOverride) {
                    return $1
                }
            )
        }

        var output = "[\(level)] \(file.components(separatedBy: "/").last!):\(line) \(message.description)"

        if combinedPrettyMetadata != nil {
            output += " -- " + combinedPrettyMetadata!
        }

        oslogger.log(level: self.oslogLevelTransformer(level), "\(output)")

        recorder?.recorde(message: output)
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

    private func prettify(_ metadata: Logger.Metadata) -> String? {
        if metadata.isEmpty {
            return nil
        }
        return metadata.map {
            "\($0)=\($1)"
        }.joined(separator: " ")
    }
}
