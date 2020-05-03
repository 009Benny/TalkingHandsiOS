//
//  MenuViewController.swift
//  TalkingHandsApp
//
//  Created by Sandra on 20/04/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    @IBOutlet weak var menuCollection: UICollectionView?
    var arrayMenu:[MenuItem]?
    var delegate:ViewControllerDelegate?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, withArray array:NSArray) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        if let menu = array as? [MenuItem]{
            self.arrayMenu = menu
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuCollection?.delegate = self
        self.menuCollection?.dataSource = self
        self.menuCollection?.register(UINib(nibName: "MenuItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "menuItem")
    }
    
    func reloadData(){
        self.menuCollection?.reloadData()
    }
    
    // MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayMenu?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuItem", for: indexPath) as? MenuItemCollectionViewCell{
            if let item = self.arrayMenu?[indexPath.row]{
                cell.updateContent(withItem: item)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = self.arrayMenu?[indexPath.row]{
            self.delegate?.showContent(withItem: item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width*0.9, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return UIScreen.main.bounds.width * 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: UIScreen.main.bounds.width * 0.05, left: 0, bottom: UIScreen.main.bounds.width * 0.1, right: 0)
    }
    
}
