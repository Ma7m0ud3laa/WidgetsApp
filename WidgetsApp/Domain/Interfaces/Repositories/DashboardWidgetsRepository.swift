//
//  DashboardWidgetsRepository.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import Foundation

protocol DashboardWidgetsRepository {
    func fetch() -> [Widget]
}
