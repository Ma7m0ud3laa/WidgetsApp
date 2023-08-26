//
//  DefaultDashboardWidgetsRepository.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import Foundation

final class DefaultDashboardWidgetsRepository: DashboardWidgetsRepository, JSONLoaderProtocol {
    
    func fetch() -> [Widget] {
        self.loadJSON(fileName: AppMockJSON.dashboard.rawValue, type: [Widget].self)
    }
    
}

