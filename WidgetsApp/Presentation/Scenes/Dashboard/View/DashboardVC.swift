//
//  DashboardVC.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import UIKit

class DashboardVC: BaseWireFrame<DashboardViewModelProtocol> {
    
    
    var widgetsList: UICollectionView = {
        let customViewLayout: UICollectionViewFlowLayout = .init()
        customViewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: customViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = .init(top: 0, left: 0, bottom: 34, right: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        self.setupWidgetList()
        self.viewModel.inputs.viewDidLoad()
        self.handleNavigation()
        self.handleStyle()
    }
    
    private
    func handleNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Dashboard"
    }
    
    private
    func handleStyle() {
        //TODO: We have to depend on design system while using colors 
        self.view.backgroundColor = .init(named: "Background")
    }
    
    override
    func loadView() {
        super.loadView()
        self.setupViews()
    }
    
    private
    func setupViews() {
        
        self.view.addSubview(self.widgetsList)
        
        NSLayoutConstraint.activate([
            self.widgetsList.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.widgetsList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            self.widgetsList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            self.widgetsList.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
    }
    
    private
    func setupWidgetList() {
        self.widgetsList.dataSource = self
        self.widgetsList.delegate = self
        WidgetType.allCases.forEach{ $0.reguest(for: self.widgetsList) }
    }
        
    override
    func bind() {
        //TODO: Do a workaround to handle diffable data sources
        
        self.viewModel.outputs.widgets.sink {[weak self] widgets in
            guard let self else {return}
            DispatchQueue.main.async {
                self.widgetsList.reloadData()
            }
        }.store(in: &cancelable)
    }
    
}


extension DashboardVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.outputs.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let widgetTypeCell = self.viewModel.outputs.widgetType(forItemAt: indexPath).widgetCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: widgetTypeCell.identifier, for: indexPath)
        
        if let _ = cell as? WidgetCellProtocol {
            //TODO: setup cell inputs and delegates like config and so on
        }
        
        return cell
    }
    
}

extension DashboardVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.viewModel.outputs.widgetType(forItemAt: indexPath).size(collectionView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
