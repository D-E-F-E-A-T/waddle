/// A Task is a singular unit of functionality available to Waddle. In addition
/// to its own actions, it can declare dependencies
public protocol Task: CustomStringConvertible {

    /// Name of this Task. This is used both when displaying task information
    /// to the user and as a means of calling the task.
    var name: String { get }

    /// Dependencies of this Task. This is an array of other task names which
    /// need to be run first in the order specified.
    var dependencies: [String] { get }

    /// Runs this task. If the task was successful and execution can continue,
    /// true should be returned. Otherwise, if an error occurred, false should
    /// be returned.
    func run() -> Bool
}
