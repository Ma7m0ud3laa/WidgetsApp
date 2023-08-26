//
//  BaseWireFrame.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import UIKit
import Combine

class BaseWireFrame<T>: UIViewController{
    
    lazy var cancelable: Set<AnyCancellable> = {
        return Set<AnyCancellable>()
    }()
    
    var viewModel: T!
    var coordinator: Coordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind()
    }
    
    func bind(){
        fatalError("Override bind function first")
    }
    
    func configure(viewModel: T, coordinator: Coordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
    
}

