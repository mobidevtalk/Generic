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
    /*:
     String type
     */
    func test_nonPalindrome_string_false() {
        let input = "nonPalindrome"
        XCTAssertFalse(input.isPalindrome, "\(input) is not be a Palindrome")
    }
    
    func test_palindrome_string_true() {
        let input = "wow"
        XCTAssertTrue(input.isPalindrome, "\(input) is a Palindrome")
    }
    
    func test_nonPalindrome_text_false() {
        let input = "This is a non-palindrome text"
        XCTAssertFalse(input.isPalindrome, "Should have return flase for: \n \(input)")
    }
    
    func test_palindrom_text_true() {
        let input = "wow wow"
        XCTAssertTrue(input.isPalindrome, "Should have return true for: \(input)")
    }
    
    func test_nonPalindrom_textWithSpace_false() {
        let input = "wow wow "
        XCTAssertFalse(input.isPalindrome, "Should have return true for: \(input)")
    }
    
    func test_nonPalindrome_mixCase_false() {
        let input = "Wow wow"
        XCTAssertFalse(input.isPalindrome, "Should return false as ther is a capital W on the\n \(input)")
    }
    
    func test_palindrom_mixCase_true() {
        let input = "Wow woW"
        XCTAssertTrue(input.isPalindrome, "Even case is mixed but this is a palindrome text:\n \(input)")
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
