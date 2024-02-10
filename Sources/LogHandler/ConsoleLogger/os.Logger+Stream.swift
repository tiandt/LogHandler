import Foundation
import os.log

public extension OSLogger {

    func log<Stream>(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, to stream: inout Stream, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) where Stream : TextOutputStream {
        let message = "\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))"
        stream.write(message)
        self.log("\(message, privacy: .public)")
    }

    func notice<Stream>(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, to stream: inout Stream, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) where Stream : TextOutputStream {
        let message = "\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))"
        stream.write(message)
        self.notice("\(message, privacy: .public)")
    }

    func debug<Stream>(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, to stream: inout Stream, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) where Stream : TextOutputStream {
        let message = "\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))"
        stream.write(message)
        self.debug("\(message, privacy: .public)")
    }

    func trace<Stream>(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, to stream: inout Stream, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) where Stream : TextOutputStream {
        let message = "\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))"
        stream.write(message)
        self.trace("\(message, privacy: .public)")
    }

    func info<Stream>(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, to stream: inout Stream, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) where Stream : TextOutputStream {
        let message = "\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))"
        stream.write(message)
        self.info("\(message, privacy: .public)")
    }

    func error<Stream>(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, to stream: inout Stream, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) where Stream : TextOutputStream {
        let message = "\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))"
        stream.write(message)
        self.error("\(message, privacy: .public)")
    }

    func warning<Stream>(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, to stream: inout Stream, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) where Stream : TextOutputStream {
        let message = "\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))"
        stream.write(message)
        self.warning("\(message, privacy: .public)")
    }

    func fault<Stream>(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, to stream: inout Stream, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) where Stream : TextOutputStream {
        let message = "\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))"
        stream.write(message)
        self.fault("\(message, privacy: .public)")
    }

    func critical<Stream>(_ items: Any..., separator: String = LoggerConfiguration.separator, terminator: String = LoggerConfiguration.terminator, to stream: inout Stream, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) where Stream : TextOutputStream {
        let message = "\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))"
        stream.write(message)
        self.critical("\(message, privacy: .public)")
    }
}

public extension OSLogger {
    func stream<Stream>(
        level: OSLogType,
        _ items: Any...,
        separator: String = LoggerConfiguration.separator,
        terminator: String = LoggerConfiguration.terminator,
        to stream: inout Stream,
        file: String = #file,
        function: String = #function,
        line: Int = #line,
        column: Int = #column
    ) where Stream : TextOutputStream {
        let message = ("\(LoggerConfiguration.handler(separator, terminator, file, function, line, column, items))")
        stream.write(message)
        self.logLevel(level, (message)) // It prints things like \n \t as is, without formatting the text.
        // self.log(level: level, "\(message, privacy: .private(mask: .hash))") // It prints things like \n \t as is, without formatting the text.
    }
}
