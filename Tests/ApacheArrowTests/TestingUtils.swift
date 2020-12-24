import XCTest

public var registeredTestEntries: [XCTestCaseEntry] {
    return [
        ApacheArrowTests.entry
    ]
}

#if canImport(ObjectiveC)
// Duplicate definitions only available on Linux
// See: https://github.com/apple/swift-corelibs-xctest/blob/main/Sources/XCTest/Public/XCTestCase.swift

/// A block with the test code to be invoked when the test runs.
///
/// - Parameter testCase: the test case associated with the current test code.
public typealias XCTestCaseClosure = (XCTestCase) throws -> Void

/// This is a compound type used by `XCTMain` to represent tests to run. It combines an
/// `XCTestCase` subclass type with the list of test case methods to invoke on the class.
/// This type is intended to be produced by the `testCase` helper function.
/// - seealso: `testCase`
/// - seealso: `XCTMain`
public typealias XCTestCaseEntry = (testCaseClass: XCTestCase.Type, allTests: [(String, XCTestCaseClosure)])

/// Wrapper function allowing an array of static test case methods to fit
/// the signature required by `XCTMain`
/// - seealso: `XCTMain`
public func testCase<T: XCTestCase>(_ allTests: [(String, (T) -> () throws -> Void)]) -> XCTestCaseEntry {
    // Since these functions are only used for type-checking, the implementation is never actually called.
    fatalError("This is never called when ObjectiveC is available.")
}

/// Wrapper function for the non-throwing variant of tests.
/// - seealso: `XCTMain`
public func testCase<T: XCTestCase>(_ allTests: [(String, (T) -> () -> Void)]) -> XCTestCaseEntry {
    // Since these functions are only used for type-checking, the implementation is never actually called.
    fatalError("This is never called when ObjectiveC is available.")
}
#endif

protocol TestCase {
    typealias TestEntry = (String, (Self) -> () throws -> Void)
    static var testEntries: [TestEntry] { get }
    static var entry: XCTestCaseEntry { get }
}

extension TestCase where Self: XCTestCase {
    static var entry: XCTestCaseEntry {
        return testCase(Self.testEntries)
    }
}
