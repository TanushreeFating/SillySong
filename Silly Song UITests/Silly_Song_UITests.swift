//
//  Silly_Song_UITests.swift
//  Silly Song UITests
//
//  Created by Tanushree Fatinge on 9/11/18.
//  Copyright © 2018 Mindbody. All rights reserved.
//
import XCTest

class Silly_Song_UITests: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testTitle(){
        XCTAssert(app.staticTexts["Silly Song"].exists)
    }
    func testBackgroundImage(){
        
        XCTAssert(app.images["3.png"].exists)
    }
    func testTextFieldValue() {
        let enterYourNameTextField = app.textFields["Enter Your Name"]
        enterYourNameTextField.tap()
        enterYourNameTextField.typeText("tanu")
       // XCTAssertEqual(enterYourNameTextField.exists, true)
         XCTAssertEqual(enterYourNameTextField.value as! String, "tanu", "Text field value is  correct")
        }
    
    func testTextView(){
//        let enterYourNameTextField = app.textViews["<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>","Banana Fana Fo F<SHORT_NAME>","Me My Mo M<SHORT_NAME>","<FULL_NAME>"]
//        //enterYourNameTextField.tap()
//        app.otherElements.containing(.image, identifier:"3.png").children(matching: .textView).element.exists
        let textView = app.otherElements.containing(.image, identifier:"3.png").children(matching: .textView).element
        //textView.tap()
        
        
        
    }
//    func testLyricsView(){
//        let nameTextField = app.textFields["Enter Your Name"]
//        nameTextField.tap()
//        nameTextField.typeText("tanu")
//        XCUIApplication().otherElements.containing(.image, identifier:"3.png").children(matching: .textView).element.tap()
//        app.otherElements.containing(.image, identifier:"3.png").element.tap()
//        let lyricsText = app.staticTexts["Tanu, Tanu, Bo Banu Banana Fana Fo Fanu Me My Mo Manu Tanu"]
////        XCTAssertEqual(lyricsText.value as! String, "Tanu, Tanu, Bo Banu Banana Fana Fo Fanu Me My Mo Manu Tanu", "Text field value is  correct")
//
////        XCTAssert([lyricsText.value, isEqualToString:@"Tanu, Tanu, Bo Banu Banana Fana Fo Fanu Me My Mo Manu Tanu"]);
////
//
//        }
    
}



