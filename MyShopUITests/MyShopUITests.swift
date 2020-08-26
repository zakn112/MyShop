//
//  MyShopUITests.swift
//  MyShopUITests
//
//  Created by Андрей Закусов on 17.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import XCTest

class MyShopUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        setupSnapshot(app)
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testLogin() throws {
        // UI tests must launch the application that they test.
        
        app.launch()
        
        snapshot("LoginScreen")
        
        let userNameField = app.textFields["userNameField"]
        userNameField.tap()
        userNameField.typeText("user")
        
        let passwordField = app.textFields["passwordField"]
        passwordField.tap()
        passwordField.typeText("123")
        
        let loginButton = app.buttons["Log in"]
        loginButton.tap()
               
        if app.tabBars.buttons["Goods"].exists {
        snapshot("GoodsScreen")
            XCTAssert(true)
        }else{
            XCTFail()
        }
        
    }
    
    func testSingin() throws {
         app.launch()
        
        let singButtonLoginWindow = app.buttons["Sing in"]
        singButtonLoginWindow.tap()
          
        let singButtonSinginWindow = app.buttons["Sing in"]
                
        if !singButtonSinginWindow.exists {
            snapshot("SinginScreen")
            XCTFail()
            return
        }
        
        let userNameField = app.textFields["userNameField"]
        userNameField.tap()
        userNameField.typeText("user")
        
        let passwordField = app.textFields["passwordField"]
        passwordField.tap()
        passwordField.typeText("123")

        singButtonSinginWindow.tap()
        
        if app.alerts["Success"].scrollViews.otherElements.buttons["OK"].exists {
            XCTAssert(true)
        }else{
            XCTFail()
        }
        
        
      }
    
  
}
