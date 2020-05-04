//
//  MenuItem.swift
//  TalkingHandsApp
//
//  Created by Sandra on 20/04/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit

class MenuItem: NSObject {
    var id:Int?
    var title:String?
    var section:String?
    var image:UIImage?
    var modules:NSArray?
    var status:Bool?
    
    init(withDictionary dictionary:NSDictionary){
        let id = dictionary.object(forKey: "id") as? String ?? ""
        self.id = Int(id) ?? 0
        self.title = dictionary.object(forKey: "title") as? String ?? ""
        self.section = dictionary.object(forKey: "section") as? String ?? ""
        let status = dictionary.object(forKey: "status") as? String ?? ""
        self.status = status == "true"
        let image = dictionary.object(forKey: "image") as? String ?? ""
        if image != "" {
            self.image = UIImage(named: image)
        }
        if let modules = dictionary.object(forKey: "modules") as? NSArray{
            let aux = NSMutableArray()
            for item in modules {
                if let dictionary = item as? NSDictionary{
                    aux.add(MenuItem(withDictionary: dictionary))
                }
            }
            self.modules = NSArray(array: aux)
        }
        
    }

}
