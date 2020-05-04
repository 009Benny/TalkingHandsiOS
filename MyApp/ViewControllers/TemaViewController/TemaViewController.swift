//
//  TemaViewController.swift
//  MyApp
//
//  Created by Benny Reyes on 03/05/20.
//  Copyright © 2020 Benny Reyes. All rights reserved.
//

import UIKit

class TemaViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var temaCollectionView: UICollectionView?
    var items:[MenuItem]?
    var delegate:ViewControllerDelegate?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, withArray array:[MenuItem] ) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.items = array
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.temaCollectionView?.delegate = self
        self.temaCollectionView?.dataSource = self
        self.temaCollectionView?.register(UINib(nibName: "ItemTemaCollectionVeiwCell", bundle: nil), forCellWithReuseIdentifier: "temaItem")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.temaCollectionView?.reloadData()
    }
    
    //MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "temaItem", for: indexPath) as? ItemTemaCollectionVeiwCell{
            print(self.items ?? [])
            if let item = self.items?[indexPath.row]{
                cell.updateConent(item: item)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = self.items?[indexPath.row]{
            if item.status == true{
                self.delegate?.showContent(withItem: item)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.9, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
}
