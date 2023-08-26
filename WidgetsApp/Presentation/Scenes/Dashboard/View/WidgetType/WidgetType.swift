//
//  WidgetType.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 26/08/2023.
//

import UIKit

enum WidgetType: String, CaseIterable {
    
    case mini
    case square
    case large
    
}

extension WidgetType {
    
    var widgetCell: WidgetCellProtocol.Type {
        switch self {
        case .mini:
            return MiniCell.self
        case .square:
            return SquareCell.self
        case .large:
            return LargeCell.self
        }
    }
    
}

extension WidgetType {
    
    func reguest(for collectionView: UICollectionView) {
        switch self {
        case .mini:
            collectionView.register(MiniCell.self, forCellWithReuseIdentifier: MiniCell.identifier)
        case .square:
            collectionView.register(SquareCell.self, forCellWithReuseIdentifier: SquareCell.identifier)
        case .large:
            collectionView.register(LargeCell.self, forCellWithReuseIdentifier: LargeCell.identifier)
        }
    }
    
    func size(collectionView: UICollectionView) -> CGSize {
        
        let width = collectionView.frame.width
        switch self {
        case .mini:
            return .init(width: (width / 4), height: (width / 4))
        case .square:
            return .init(width: (width / 2), height: (width / 2))
        case .large:
            return .init(width: width, height: 200)
        }
    }
  
    
}
