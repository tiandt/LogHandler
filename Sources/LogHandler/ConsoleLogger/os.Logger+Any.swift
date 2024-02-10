import Foundation
import os.log

// Log not only OSLogMessage but Any, no more `No exact matches in call to instance method 'appendInterpolation'`
public extension OSLogger {

    func logAny(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.log("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items), privacy: .public)")
    }

    func noticeAny(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.notice("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items), privacy: .public)")
    }

    func debugAny(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.debug("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items), privacy: .public)")
    }

    func traceAny(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.debug("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items), privacy: .public)")
    }

    func infoAny(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.debug("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items), privacy: .public)")
    }

    func errorAny(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.error("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items), privacy: .public)")
    }

    func warningAny(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.warning("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items), privacy: .public)")    }

    func faultAny(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.fault("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items), privacy: .public)")
    }

    func criticalAny(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.fault("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items), privacy: .public)")
    }
}

public extension OSLogger {
    func logLevel(_ level: OSLogType, _ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        self.log(level: level, ("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))")) // It prints things like \n \t as is, without formatting the text.
    }
}
