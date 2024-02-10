//
//  SwiftLog.swift
//
//
//  Created by tdt on 2018/3/7.
//  Copyright © 2018年 tdt. All rights reserved.
//

import Foundation
import Logging

/**
 log等级
 
 - author: tdt
 - date: 16-07-26 15:07:23
 
 - trace: 不是很需要输出的,比如网络请求,比如无用的状态展示
 - debug:   开发时要显示的数据,开发完成后,有可能降级为verbose,也有可能升级为info
 - info:    经常需要显示的信息
 - warning: 警告
 - error:   错误
 */
public enum LogLevel: Int {
    case trace = 0, debug, info, notice, warning, error, critical
}

///和LogLevel枚举配套的>=方法
private func >= (lhs: LogLevel, rhs: LogLevel) -> Bool {
    lhs.rawValue >= rhs.rawValue
}

#if STUDIO_PRINT
//定义最低输出的level,可动态配置
private var mylogger: LoggerHandler = {
    LoggerHandler(minimumLogLevel: LoggerConfiguration.minimumLogLevel, dateFormat: "yyyy-MM-dd HH:mm:ss.SSS")
}()
#else
private let mylogger: LoggerHandler = LoggerHandler(minimumLogLevel: .warning, dateFormat: "yyyy-MM-dd HH:mm:ss.SSS")
#endif

private struct LoggerHandler {

    static let logger: Logger = {
        var logger = Logger(label: Bundle.main.bundleIdentifier!)
#if STUDIO_PRINT
        logger.logLevel = .trace //控制最低输出的层级
#endif
        return logger
    }()
    var minimumLogLevel: LogLevel
    var dateFormat: String = "yyyy-MM-dd HH:mm:ss.SSS"
    
    func loggerPrint(logLevel: LogLevel, items: [Any], separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String, function: String, line: Int, column: Int) {
#if STUDIO_PRINT
        guard logLevel >= minimumLogLevel else { return }

        //对item和function进行处理
        let msg = LoggerConfiguration.handler(separator, terminator, file, function, line, column, items)

        var output: String = ""
        switch logLevel {
        case .trace:
            output = "💚\(msg)"
            Self.logger.trace("\(output)")
        case .debug:
            output = "💚\(msg)"
            Self.logger.debug("\(output)")
        case .info:
            output = "💚\(msg)"
            Self.logger.info("\(output)")
        case .notice:
            output = "🧡\(msg)"
            Self.logger.notice("\(output)")
        case .warning:
            output = "🧡\(msg)"
            Self.logger.warning("\(output)")
        case .error:
            output = "❤️\(msg)"
            Self.logger.error("\(output)")
        case .critical:
            output = "❤️\(msg)"
            Self.logger.critical("\(output)")
        }
#endif
    }

}

public func printTrace(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    mylogger.loggerPrint(logLevel: .trace, items: items, separator: separator, terminator: terminator, file: file, function: function, line: line, column: column)
}

public func printDebug(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    mylogger.loggerPrint(logLevel: .debug, items: items, separator: separator, terminator: terminator, file: file, function: function, line: line, column: column)
}

public func printInfo(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    mylogger.loggerPrint(logLevel: .info, items: items, separator: separator, terminator: terminator, file: file, function: function, line: line, column: column)
}

public func printNotice(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    mylogger.loggerPrint(logLevel: .notice, items: items, separator: separator, terminator: terminator, file: file, function: function, line: line, column: column)
}

public func printWarning(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    mylogger.loggerPrint(logLevel: .warning, items: items, separator: separator, terminator: terminator, file: file, function: function, line: line, column: column)
}

public func printError(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    mylogger.loggerPrint(logLevel: .error, items: items, separator: separator, terminator: terminator, file: file, function: function, line: line, column: column)
}

public func printCritical(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    mylogger.loggerPrint(logLevel: .critical, items: items, separator: separator, terminator: terminator, file: file, function: function, line: line, column: column)
}
