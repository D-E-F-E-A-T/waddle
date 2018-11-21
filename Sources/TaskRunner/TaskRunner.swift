import TaskDescription

public enum TaskRunnerErrors: Error {
    case circularTaskDependency, taskNotDefined, taskFailedToExecute
}


/// A TaskRunner is the primary class used to consume and execute Tasks.
public class TaskRunner {
    let tasks: [String: Task]

    public init(tasks: [String: Task]) {
        self.tasks = tasks
    }

    public convenience init(taskList: [Task]) {
        self.init(
            tasks: Dictionary(
                grouping: taskList, by: { $0.name }).mapValues { $0.first! })
    }

    /// Runs a given task (by name, case-insensitive) as well as all of its
    /// dependencies. Will throw an error if given an invalid task name and/or
    /// a circular task dependency is found.
    public func run(taskName: String, pendingTaskNames: [String] = []) throws {
        guard let taskToRun = tasks[taskName] else {
            throw TaskRunnerErrors.taskNotDefined
        }

        guard !pendingTaskNames.contains(taskName) else {
            throw TaskRunnerErrors.circularTaskDependency
        }

        for dependencyTask in taskToRun.dependencies {
            try run(taskName: dependencyTask,
                pendingTaskNames: pendingTaskNames + [taskName])
        }

        do {
            try taskToRun.run()
        } catch {
            throw TaskRunnerErrors.taskFailedToExecute
        }
    }
}
