//
//  ItemTemaCollectionVeiwCell.swift
//  MyApp
//
//  Created by Benny Reyes on 03/05/20.
//  Copyright © 2020 Benny Reyes. All rights reserved.
//

import UIKit

class ItemTemaCollectionVeiwCell: UICollectionViewCell {
    @IBOutlet weak var viewContainer: UIView?
    @IBOutlet weak var imgModule: UIImageView?
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var swModule: UISwitch?
    var item:MenuItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewContainer?.layer.cornerRadius = 10
        self.viewContainer?.clipsToBounds = false
        self.imgModule?.layer.cornerRadius = 10
        self.imgModule?.clipsToBounds = true
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 12.0;
        self.layer.shadowOpacity = 0.7;
    }
    
    func updateConent(item:MenuItem){
        self.item = item
        self.lblTitle?.text = item.title ?? ""
        self.imgModule?.image = item.image
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        print("Change")
    }
}
