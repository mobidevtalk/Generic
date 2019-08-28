//: A UIKit based Playground for presenting user interface
  
import Foundation

extension String{
    var isPalindrome: Bool {
        return self == String(self.reversed())
    }
}


/*:
 Test Suite
 */
import XCTest

class TestSuite: XCTestCase{
    func test_nonPalindrome_string_false() {
        let input = "nonPalindrome"
        XCTAssertFalse(input.isPalindrome, "\(input) is not be a Palindrome")
    }
    
    func test_palindrome_strint_true() {
        let input = "wow"
        XCTAssertTrue(input.isPalindrome, "\(input) is a Palindrome")
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
TestSuite.defaultTestSuite.run()
