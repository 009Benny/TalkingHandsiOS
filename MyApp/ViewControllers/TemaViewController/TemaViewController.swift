//
//  TemaViewController.swift
//  MyApp
//
//  Created by Benny Reyes on 03/05/20.
//  Copyright © 2020 Benny Reyes. All rights reserved.
//

import UIKit

protocol temaDelegate {
    func updateUser(id:Int, activate:Bool)
}

class TemaViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, temaDelegate{
    @IBOutlet weak var temaCollectionView: UICollectionView?
    var items:[MenuItem]?
    var actives:NSArray?
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
        if let user = UserDefaults.standard.object(forKey: "user") as? NSDictionary{
            if let array = user.object(forKey: "items") as? NSArray{
                self.actives = array
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.temaCollectionView?.reloadData()
    }
    
    //MARK: - Update User
    func updateUser(id:Int, activate:Bool){
        if let user = UserDefaults.standard.object(forKey: "user") as? NSDictionary{
            if let array = user.object(forKey: "items") as? NSArray{
                let mutable = NSMutableArray()
                for item in array{
                    mutable.add(id)
                }
                if activate{
                    if !array.contains(id) {
                        mutable.add(id)
                    }
                }else{
                    if array.contains(id) {
                        mutable.remove(id)
                    }
                }
                self.setArrayToUser(array: NSArray(array: mutable))
            }else if activate {
                self.setArrayToUser(array: NSArray(array: [id]))
            }

        }
    }
    
    func setArrayToUser(array:NSArray){
        if let user = UserDefaults.standard.object(forKey: "user") as? NSDictionary{
            let data:[String:Any] = [
                "name":user.object(forKey: "name") ?? "",
                "nickname":user.object(forKey: "nickname") ?? "",
                "birthday":user.object(forKey: "birthday") ?? "",
                "email":user.object(forKey: "email") ?? "",
                "pass":user.object(forKey: "pass") ?? "",
                "items":array
            ]
            UserDefaults.standard.set(data, forKey: "user")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    //MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "temaItem", for: indexPath) as? ItemTemaCollectionVeiwCell{
            cell.delegate = self
            if let item = self.items?[indexPath.row]{
                cell.updateConent(item: item)
                if self.actives?.contains(item.id ?? 0) ?? false{
                    cell.swModule?.isOn = true
                }
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
