//
//  MainNavigator.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import UIKit

public class MainNavigator: Navigator{
    
    public var coordinator: Coordinator
    
    public enum Destination {
        
        //MARK: General
        case dashboard
        
    }
    
    required public init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    public func viewController(for destination: Destination) -> UIViewController {
        switch destination {
            
            //MARK: General
        case .dashboard:
            let viewController = DashboardVC()
            viewController.viewModel = DashboardViewModel()
            return viewController
        }
        
    }
}
