//
//  DashboardViewModel.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import Foundation
import Combine

protocol DashboardViewModelProtocol {
    var inputs: DashboardViewModelInputsProtocol { get set }
    var outputs: DashboardViewModelOutputsProtocol { get }
}

protocol DashboardViewModelInputsProtocol {
    func viewDidLoad()
}

protocol DashboardViewModelOutputsProtocol {
    var widgets: CurrentValueSubject<[WidgetType], Never> { get }
    var numberOfItems: Int { get }
    
    func widgetType(forItemAt indexPath: IndexPath) -> WidgetType 
}

class DashboardViewModel: DashboardViewModelInputsProtocol,
                          DashboardViewModelOutputsProtocol,
                          DashboardViewModelProtocol {
    
    var inputs: DashboardViewModelInputsProtocol {
        get {
            return self
        } set {}
    }
    
    var outputs: DashboardViewModelOutputsProtocol {
        return self
    }
    
    
    private let dashboardWidgetsRepository: DashboardWidgetsRepository
    init(dashboardWidgetsRepository: DashboardWidgetsRepository = DefaultDashboardWidgetsRepository()) {
        self.dashboardWidgetsRepository = dashboardWidgetsRepository
    }
    
    func viewDidLoad() {
        self.fetchWidgets()
    }
    
    private(set) var widgets: CurrentValueSubject<[WidgetType], Never> = .init([])
    
    var numberOfItems: Int {
        self.widgets.value.count
    }
    
    func widgetType(forItemAt indexPath: IndexPath) -> WidgetType {
        return self.widgets.value[indexPath.item]
    }
}

extension DashboardViewModel {
    
    private
    func fetchWidgets() {
        let widgets = self.dashboardWidgetsRepository.fetch()
        
        let widgetsTypes = widgets.compactMap({WidgetType(rawValue: $0.style ?? "")})
        
        self.widgets.send(widgetsTypes)
    }
    
}
