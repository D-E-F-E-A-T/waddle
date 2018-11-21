import Quick
import Nimble
import TaskDescription

class ExternalCommandSpec: QuickSpec {

    override func spec() {
        describe("An External Command task") {
            it("does not throw on a zero exit code") {
                let task = ExternalCommand(name: "succeed", command: ["true"])
                expect { try task.run() }.toNot(throwError())
            }

            it("throws nonZeroExitCode on a non-zero exit code") {
                let task = ExternalCommand(name: "fail", command: ["false"])
                expect { try task.run() }.to(throwError(errorType:
                    ExternalCommandError.self))
            }
        }
    }

}
