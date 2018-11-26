import Quick
import Nimble
import TaskDescription
import TaskRunner

fileprivate class StubTask: Task {
    let name: String
    let dependencies: [String]
    var description: String {
        return "Stub task \(name) which depends on \(dependencies)"
    }

    init(name: String, dependencies: [String]) {
        self.name = name
        self.dependencies = dependencies
    }

    func run() throws { }
}

class TaskRunnerSpec: QuickSpec {

    override func spec() {
        describe("A task runner") {
            it("will throw an error when a nonexistent task is called") {
                let runner = TaskRunner(taskList: [])

                expect { try runner.run(taskName: "this is a problem!") }.to(throwError())
            }

            it("will throw an error when a circular dependency is encountered") {
                let runner = TaskRunner(taskList: [
                    StubTask(
                        name: "a",
                        dependencies: ["b"]),
                    StubTask(
                        name: "b",
                        dependencies: ["a"])
                ])

                expect { try runner.run(taskName: "a") }.to(throwError())
            }
        }
    }
}
