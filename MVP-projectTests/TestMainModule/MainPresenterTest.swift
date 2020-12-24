//
//  MainPresenterTest.swift
//  MVP-projectTests
//
//  Created by Василий Петухов on 24.12.2020.
//

import XCTest
@testable import MVP_project // импорт таргета

// тестовая вьюха
class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        view = nil
        person = nil
        presenter = nil
    }
    
    func testModuleIsNotNil(){
        XCTAssertNotNil(view)
        XCTAssertNotNil(person)
        XCTAssertNotNil(presenter)
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "BazBar")
    }
    
    func testPersonModel(){
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Barf")
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
