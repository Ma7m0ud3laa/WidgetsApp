//
//  LargeCell.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 26/08/2023.
//

import UIKit

class LargeCell: UICollectionViewCell, WidgetCellProtocol {
    
    fileprivate
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private
    func setupView() {
        self.contentView.addSubview(self.container)
        
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            self.container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5)
        ])
    }
    
}
