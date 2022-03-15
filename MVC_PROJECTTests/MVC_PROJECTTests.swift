//
//  MVC_PROJECTTests.swift
//  MVC_PROJECTTests
//
//  Created by Andre Linces on 15/03/22.
//

import XCTest

@testable import MVC_PROJECT

class MVC_PROJECTTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCourseViewModel() {
        let course = Course(id: 0, name: "My Course Name", numberOfLessons: 10)
        //let courseCell = CourseCell(course: course )
        // what is it that we want to test?
        XCTAssertEqual(course.name, course.name)
        
    }
    

}
