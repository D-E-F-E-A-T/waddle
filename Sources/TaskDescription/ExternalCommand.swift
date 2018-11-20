import Foundation

/// An ExternalCommand is a task that simply invokes an external shell command.
/// It fails if the command returns with a non-zero exit code.
public class ExternalCommand: Task {
    public let name: String
    public let dependencies: [String]

    public var description: String {
        return "Command " + command.joined(separator: " ")
    }

    private let command: [String]

    public init(name: String, command: [String], dependencies: [String] = []) {
        self.name = name
        self.command = command
        self.dependencies = dependencies
    }

    public func run() -> Bool {
        let task = Process()

        task.launchPath = "/usr/bin/env"
        task.arguments = command
        task.launch()
        task.waitUntilExit()

        return task.terminationStatus == 0
    }

}
