//
//  RandomUserAPIClientTest.swift
//  RandomUserAppTests
//
//  Created by Junier Damian on 12/14/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import RandomUserApp

class RandomUserAPIClientTest: XCTestCase {
    var randomUserAPIClient: RandomUserAPIClient?
    override func setUp() {
        super.setUp()
        self.randomUserAPIClient = RandomUserAPIClient()
    }

    override func tearDown() {
        super.tearDown()
        OHHTTPStubs.removeAllStubs()
    }
    
    func testGetUserFirstPage() {
        // Arrange
        let expectRequest: XCTestExpectation = expectation(description: "User first page")
        stub(condition: isHost("randomuser.me")) { _ in
            let jsonResponsePath = OHPathForFile("user.json", type(of: self))
            return fixture(filePath: jsonResponsePath!, headers: ["Content-Type":"application/json"])
        }
        let userCountExpected = 30
        
        let completion: (UserList?, String?) -> Void = { users, _ in
            // Asset
            XCTAssertEqual(users?.list?.count, userCountExpected)
            expectRequest.fulfill()
        }
        
        // Act
        self.randomUserAPIClient?.request(
            route: RandomUserAPIRoutes.getUsers(page: 1, limit: 30),
            completion: completion)
        
        waitForExpectations(timeout: 30, handler: { error in
            XCTAssertNil(error, "Timeout")
        })
    }
    
    func testOfflineServiceResponse() {
        // Arrange
        let expectRequest: XCTestExpectation = expectation(description: "Test server offline response")
        stub(condition: isHost("randomuser.me")) { _ in
            let jsonResponsePath = OHPathForFile("offline.json", type(of: self))
            return fixture(filePath: jsonResponsePath!, status: 503, headers: ["Content-Type":"application/json"])
        }
        let messageExpected = "Uh oh, something has gone wrong. Please tweet us @randomapi about the issue. Thank you."
        
        let completion: (UserList?, String?) -> Void = { _, error in
            // Asset
            XCTAssertEqual(error, messageExpected)
            expectRequest.fulfill()
        }
        
        // Act
        self.randomUserAPIClient?.request(
            route: RandomUserAPIRoutes.getUsers(page: 1, limit: 30),
            completion: completion)
        
        waitForExpectations(timeout: 30, handler: { error in
            XCTAssertNil(error, "Timeout")
        })
    }
}
