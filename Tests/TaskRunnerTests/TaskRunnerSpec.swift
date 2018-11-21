import Quick
import Nimble
import TaskRunner

class TaskRunnerSpec: QuickSpec {

    override func spec() {
        describe("A task runner") {
            it("will throw an error when a nonexistent task is called") {
                let runner = TaskRunner(taskList: [])

                expect { try runner.run(taskName: "this is a problem!") }.to(
                    throwError())
            }
        }
    }
}
