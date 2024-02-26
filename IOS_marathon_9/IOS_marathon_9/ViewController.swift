//
//  ViewController.swift
//  IOS_marathon_9
//
//  Created by Наталья Коновалова on 26.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private enum Constants {
        static let itemSize = CGSize(width: 300, height: 450)
    }
    
    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }
    
    private func setupInitialState() {
        addSubviews()
        setupCollectionViewSettings()
        setupNavigationBarSettings()
        setupConstraints()
    }
    
    private func setupCollectionViewSettings() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Constants.itemSize
        
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: mainCollectionView.layoutMargins.left,
                                           bottom: 0,
                                           right: 0)
        mainCollectionView.collectionViewLayout = layout
        mainCollectionView.decelerationRate = .normal 
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(MainCollectionViewCell.self,
                                    forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    private func addSubviews() {
        view.addSubview(mainCollectionView)
    }
    
    private func setupNavigationBarSettings() {
        title = "Collection"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MainCollectionViewCell",
            for: indexPath) as? MainCollectionViewCell
        else { return UICollectionViewCell() }
        return cell
    }
}
