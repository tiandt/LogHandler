//
//  ContentView.swift
//  LogHandlerExample
//
//  Created by tdt on 2023/3/21.
//

import SwiftUI
import Logging

struct Person {
    var name: String
    var age: Int
}

struct ContentView: View {

    let logger: Logger = Logger.content

    let alice = Person(name: "Alice", age: 17)
    let bob = Person(name: "Bob", age: 18)

    var body: some View {
        Form {

            Button {
                logger.trace("trace message", alice, bob, metadata: ["person": .string("\(bob)")])
            } label: {
                Text("trace")
            }

            Button {
                logger.debug("critical message", metadata: ["person": .array([.string("\(alice)"), .string("\(bob)")])])
            } label: {
                Text("debug")
            }

            Button {
                logger.info("info message", metadata: ["person": .dictionary(["alice": .string("\(alice)"), "bob": "\(bob)"])])
            } label: {
                Text("info")
            }

            Button {
                logger.notice("notice message", metadata: ["person": .string("\(bob)")])
            } label: {
                Text("notice")
            }

            Button {
                logger.warning("warning message", metadata: ["person": .string("\(bob)")])
            } label: {
                Text("warning")
            }

            Button {
                logger.error("error message", metadata: ["person": .string("\(bob)")])
            } label: {
                Text("error")
            }

            Button {
                logger.critical("critical message", metadata: ["person": .string("\(bob)")])
            } label: {
                Text("critical")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
