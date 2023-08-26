//
//  Navigator.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import Foundation

import UIKit

public enum NavigationTypes{
    case push(animated: Bool)
    case present(animated: Bool)
}

public protocol Navigator {
    associatedtype Destination

    func viewController(for destination: Destination) -> UIViewController
    
    var coordinator: Coordinator {get}
    init(coordinator: Coordinator)
    
    func navigate(to destination: Destination, with navigationType: NavigationTypes)
}

extension Navigator{
    public func navigate(to destination: Destination, with navigationType: NavigationTypes = .push(animated: true)){
        let viewController = self.viewController(for: destination)
        switch navigationType {
        case let .push(animated):
            coordinator.navigationController.pushViewController(viewController, animated: animated)
        case let .present(animated):
            coordinator.navigationController.present(viewController, animated: animated, completion: nil)
        }
    }
    
}
