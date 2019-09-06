//: A UIKit based Playground for presenting user interface
  
import Foundation

extension String{
    var isPalindrome: Bool {
        return self == String(self.reversed())
    }
}

extension Int{
    var isPalindrome: Bool{
        return String(self).isPalindrome
    }
}

extension Double{
    var isPalindrome: Bool{
        return String(self).isPalindrome
    }
}

//extension ExpressibleByStringLiteral{
//    var palindrome: Bool{
//        return self == String(self.reversed())
//    }
//}


/*:
 Test Suite
 */
import XCTest

class TestSuite: XCTestCase{
    
    // MARK: - String Type
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
        XCTAssertFalse(input.isPalindrome, "Should have return false for: \n \(input)")
    }
    
    func test_palindrome_text_true() {
        let input = "wow wow"
        XCTAssertTrue(input.isPalindrome, "Should have return true for: \(input)")
    }
    
    func test_nonPalindrome_textWithSpace_false() {
        let input = "wow wow "
        XCTAssertFalse(input.isPalindrome, "Should have return true for: \(input)")
    }
    
    func test_nonPalindrome_mixCase_false() {
        let input = "Wow wow"
        XCTAssertFalse(input.isPalindrome, "Should return false as there is a capital W on the\n \(input)")
    }
    
    func test_palindrome_mixCase_true() {
        let input = "Wow woW"
        XCTAssertTrue(input.isPalindrome, "Even case is mixed but this is a palindrome text:\n \(input)")
    }
    
    // MARK: - Int
    func test_nonPalindrome_Int_false(){
        let input = 100
        XCTAssertFalse(input.isPalindrome, "\(input) is not a palindrome Int")
    }
    
    func test_palindrome_Int_true() {
        let input = 121
        XCTAssertTrue(input.isPalindrome, "\(input) is a palindrome Int")
    }
    
    func test_longPalindrom_Int_true() {
        let input = 0000000000
        XCTAssertTrue(input.isPalindrome, "Long sequence on Zero should be a palindrome")
    }
    
    func test_nonPalindrome_negativeInt_false() {
        let input = -111
        XCTAssertFalse(input.isPalindrome, "\(input) should not be a palindrome")
    }
    
    // MARK: - Double
    func test_nonPalindrome_double_false() {
        let input = 12.01
        XCTAssertFalse(input.isPalindrome, "\(input) should not be a Palindrome Double")
    }
    
    func test_Palindrome_double_true() {
        let input = 12.21
        XCTAssertTrue(input.isPalindrome, "\(input) should be a Palindrome Double")
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
