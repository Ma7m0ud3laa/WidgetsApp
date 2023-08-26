//
//  MiniCell.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 26/08/2023.
//

import UIKit

class MiniCell: UICollectionViewCell, WidgetCellProtocol {
    
    fileprivate
    let stackContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    fileprivate
    let stackTopContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    fileprivate
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate
    let title: UILabel = {
       let lable = UILabel()
        lable.textColor = .black
        lable.text = "APP"
        lable.textAlignment = .center
        lable.font = .systemFont(ofSize: 12)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
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
        self.contentView.addSubview(self.stackContainer)
        
        NSLayoutConstraint.activate([
            self.stackContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.stackContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            self.stackContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            self.stackContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5)
        ])
        
        self.stackContainer.addArrangedSubview(self.stackTopContainer)
        
        self.stackContainer.addSubview(self.container)
        NSLayoutConstraint.activate([
            self.container.heightAnchor.constraint(equalTo: self.container.widthAnchor, multiplier: 1),
            self.container.centerXAnchor.constraint(equalTo: self.stackTopContainer.centerXAnchor),
            self.container.heightAnchor.constraint(equalTo: self.stackTopContainer.heightAnchor)
        ])
        
        self.stackContainer.addArrangedSubview(self.title)
        
        self.title.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
}
