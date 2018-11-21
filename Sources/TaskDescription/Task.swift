/// A Task is a singular unit of functionality available to Waddle. In addition
/// to its own actions, it can declare dependencies
public protocol Task: CustomStringConvertible {

    /// Name of this Task. This is used both when displaying task information
    /// to the user and as a means of calling the task.
    var name: String { get }

    /// Dependencies of this Task. This is an array of other task names which
    /// need to be run first in the order specified.
    var dependencies: [String] { get }

    /// Runs this task. If an error occurred while running this task and
    /// execution of other tasks should not continue, then a descriptive error
    /// should be thrown.
    func run() throws
}
