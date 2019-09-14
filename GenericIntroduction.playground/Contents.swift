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

// MARK: - Generic Function
func palindrome<T: LosslessStringConvertible>(input: T) -> Bool{
    let stringFormatted = String(input)
    return stringFormatted == String(stringFormatted.reversed())
}

// MARK: - LosslessStringConvertible
extension LosslessStringConvertible{
    var palindrome: Bool{
        let stringForm = String(self)
        return stringForm == String(stringForm.reversed())
    }
}

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
    
    func test_longPalindrome_Int_true() {
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
    
    func test_Palindrome_double_true_aroundPeriod() {
        let input = 12.121
        XCTAssertFalse(input.isPalindrome, "Even though the 12121 is a palindrome, but \(input) must be palindrome around period")
    }
    
    // MARK: - Generic function test
    func test_String() {
        let palindromeString = "wow wow"
        XCTAssertTrue(palindrome(input: palindromeString), "Should be a palindrome String")
        
        let nonPalindromeString = "nonPalindrome"
        XCTAssertFalse(palindrome(input: nonPalindromeString), "Should not be a palindrome string")
        
    }
    
    func test_Int() {
        let palindromeInt = 121
        XCTAssertTrue(palindrome(input: palindromeInt), "Should be a Int Palindrome")
        
        let nonPalindromeInt = 100
        XCTAssertFalse(palindrome(input: nonPalindromeInt), "Should not be a Palindrome Int")
    }
    
    func test_Double() {
        let palindromeDouble = 12.21
        XCTAssertTrue(palindrome(input: palindromeDouble), "Should be a Double Palindrome")
        
        let nonPalindromeDouble = 12.121
        XCTAssertFalse(palindrome(input: nonPalindromeDouble), "Should not be a Palindrome Double")
    }
    
    // MARK: - Through extending LosslessStringConvertible
    func test_palindrome() {
        let palindromeString = "wow wow"
        XCTAssertTrue(palindromeString.palindrome, "Should be a palindrome String")
        
        let nonPalindromeString = "nonPalindrome"
        XCTAssertFalse(nonPalindromeString.palindrome, "Should not be a palindrome string")
        
        let palindromeInt = 121
        XCTAssertTrue(palindromeInt.palindrome, "Should be a Int Palindrome")
        
        let nonPalindromeInt = 100
        XCTAssertFalse(nonPalindromeInt.palindrome, "Should not be a Palindrome Int")
        
        let palindromeDouble = 12.21
        XCTAssertTrue(palindromeDouble.palindrome, "Should be a Double Palindrome")
        
        let nonPalindromeDouble = 12.121
        XCTAssertFalse(nonPalindromeDouble.palindrome, "Should not be a Palindrome Double")
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
