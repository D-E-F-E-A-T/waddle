import Quick
import Nimble
import TaskDescription

class ExternalCommandSpec: QuickSpec {

    override func spec() {
        describe("An External Command task") {
            it("returns true on a zero exit code") {
                let task = ExternalCommand(
                    name: "succeed", command: ["true"])
                expect(task.run()).to(beTrue())
            }

            it("returns false on a non-zero exit code") {
                let task = ExternalCommand(
                    name: "fail", command: ["false"])
                expect(task.run()).to(beFalse())
            }
        }
    }

}
