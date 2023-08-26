//
//  DashboardWidgetsTests.swift
//  WidgetsAppTests
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import XCTest
@testable import WidgetsApp


final class DashboardWidgetsTests: XCTestCase {

    let reposatory: DashboardWidgetsRepository = DefaultDashboardWidgetsRepository()

    func testDashboardWidgets_WhenSuccessFetchWidgets() {
        
        let widgets: [Widget] = reposatory.fetch()
        
        XCTAssertFalse(widgets.isEmpty, "Can't fetch widgets!")
    }
 
    func testDashboardWidgets_MatchWidgetsCount() {
        
        let widgets: [Widget] = reposatory.fetch()
        
        XCTAssertEqual(widgets.count, 3, "Count not match!")
    }
    
    func testDashboardWidgets_AllWidgetsTypeHandled() {
        
        let widgets: [Widget] = reposatory.fetch()
        let widgetsType: [WidgetType] = widgets.compactMap({WidgetType(rawValue: $0.style ?? "")})
        
        XCTAssertEqual(widgets.count, widgetsType.count, "There is some widget types not handled!")
    }

}
