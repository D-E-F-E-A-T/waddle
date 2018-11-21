import XCTest
import Quick

@testable import TaskDescriptionTests
@testable import TaskRunnerTests

QCKMain([
    ExternalCommandSpec.self,
    TaskRunnerSpec.self
])
