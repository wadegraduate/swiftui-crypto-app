//
//  CoinDetailDataNetworkServiceTest.swift
//  SwiftUICryptoProjectTests
//
//  Created by Wadealanchan on 14/2/2024.
//

import XCTest
@testable import SwiftUICryptoProject
import Combine

final class CoinDetailDataNetworkServiceTest: XCTestCase {
    
    let marketDataNetworkService = MarketDataNetworkService()
    
    let stu = CoinDetailDataNetworkService()
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let expectation = XCTestExpectation(description: "Coin Detail Request Test")
        stu.requestCoinDetailData(coinID: "btc")
            .sink { result in
                switch result {
                case .success(let data):
                    XCTAssertNotNil(data)
                    expectation.fulfill()
                case .failure(let error):
                    XCTAssertNotNil(error)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 5.0) { error in
            print(error?.localizedDescription ?? "error")
        }
    }
    
    func testMarketDataNetwork() throws {
        let expectation = XCTestExpectation(description: "MarketDataNetwork Test")
        
        marketDataNetworkService.requestData()
            .sink { result in
                switch result {
                case .success(let data):
                    XCTAssertNotNil(data)
                    expectation.fulfill()
                case .failure(let error):
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: 5.0) { error in
            print(error?.localizedDescription ?? "error")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
