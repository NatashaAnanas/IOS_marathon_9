//
//  MainCollectionViewCell.swift
//  IOS_marathon_9
//
//  Created by Наталья Коновалова on 26.02.2024.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupInitialState() {
        layer.cornerRadius = 16
        backgroundColor = .systemGray5
    }
}
