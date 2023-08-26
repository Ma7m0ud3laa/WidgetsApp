//
//  AppCoordinator.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import UIKit

public protocol Coordinator: AnyObject {
    func start()
    var navigationController: UINavigationController! { get }
    var mainNavigator: MainNavigator { get }
}

public class AppCoordinator: Coordinator{
    
    public var navigationController: UINavigationController!
    
    let window: UIWindow
    
    public
    init(window: UIWindow = UIWindow()) {
        self.window = window
        self.window.backgroundColor = .white
    }
    
    public
    lazy var mainNavigator: MainNavigator = {
        return .init(coordinator: self)
    }()
    
    public
    var rootViewController: UIViewController {
        let rootView = self.mainNavigator.viewController(for: .dashboard)
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.isHidden = false
        self.navigationController = navigationController
        return navigationController
    }
    
    
    
    public
    func start(){
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
    
}
