//
//  ConteinerView.swift
//  MagTest
//
//  Created by Mag on 13/02/20.
//  Copyright © 2020 Mag. All rights reserved.
//

import SwiftUI

@IBDesignable
class ConteinerView: UIView {

    @IBOutlet weak var header: UICollectionView!
    @IBOutlet var view: UIView!
    @IBOutlet weak var page: UIView!
    
    var pageController: PageLogicViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        pageController = PageLogicViewController()
        pageController?.items.append(UIViewController())
        pageController?.items.append(UIViewController())
        page.addSubview(pageController!.view)
        let vc = UIViewController()
        vc.view.backgroundColor = .brown
        pageController?.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        pageController = PageLogicViewController()
        pageController?.items.append(UIViewController())
        pageController?.items.append(UIViewController())
        page.addSubview(pageController!.view)
        let vc = UIViewController()
        vc.view.backgroundColor = .brown
        pageController?.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        
    }
    
    func setup() {
        
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("Conteiner", owner: self, options: nil)
        
        addSubview(view)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        layout.itemSize = CGSize(width: view.frame.size.width, height: 100)
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        header.collectionViewLayout = layout
        
        //header.register(nib: nil, forCellWithReuseIdentifier: "xx")
        header.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "xx")
        header.contentSize = CGSize(width: 1080, height: 110)

//        header.dataSource = self
//        header.delegate = self
    }
}

extension ConteinerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "xx", for: indexPath)
//        let cell = UICollectionViewCell()
        cell.backgroundColor = .green
//        cell.frame.size = CGSize(width: 100, height: 100)
        
        return cell
    }
}
