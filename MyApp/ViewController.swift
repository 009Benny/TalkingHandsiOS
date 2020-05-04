//
//  ViewController.swift
//  TalkingHandsApp
//
//  Created by Sandra on 3/6/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
    func showMenu()
    func showContent(withItem item:MenuItem)
}

class ViewController: UIViewController, ViewControllerDelegate{
    @IBOutlet weak var viewContent: UIView?
    @IBOutlet weak var btnReturn: UIButton?
    @IBOutlet weak var viewLogo: UIView?
    @IBOutlet weak var btnLogIn: UIButton?
    @IBOutlet weak var btnRegister: UIButton?
    
    var actualController:UIViewController?
    var data:NSArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = self.loadData()
        self.configViews()
    }
    
    func configViews(){
        self.viewLogo?.clipsToBounds = true
        self.viewLogo?.layer.cornerRadius = 100
        self.btnLogIn?.layer.cornerRadius = 10
        self.btnRegister?.layer.cornerRadius = 10
    }
    
    //MARK: - Button Actions
    @IBAction func btnLogInAction(_ sender: Any) {
        let controller = LogInViewController(nibName: "LogInViewController", bundle: nil)
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func btnRegisterAction(_ sender: Any) {
        let controller = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        if self.children.count > 0{
            for item in self.children {
                if let controller = item as? TemaViewController{
                    controller.view.removeFromSuperview()
                    controller.removeFromParent()
                }
            }
        }
    }
    
    //MARK: - System
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    //MARK: - LoadData
    func loadData()->NSArray?{
        let path:String = Bundle.main.path(forResource: "menu", ofType: "json") ?? ""
        do {
            let json = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            if let array = try JSONSerialization.jsonObject(with: json, options: .mutableContainers) as? NSArray{
                return array
            }
        } catch {
            return nil
        }
        return nil
    }
    
    //MARK: - ViewControllerDelegate
    func showMenu(){
        if self.data != nil{
            let menuArray = NSMutableArray()
            for item in self.data! {
                if let dictionary = item as? NSDictionary{
                    let menu = MenuItem(withDictionary: dictionary)
                    menuArray.add(menu)
                }
            }
            let controller = MenuViewController(nibName: "MenuViewController", bundle: nil, withArray: menuArray)
            controller.delegate = self
            controller.view.frame = self.viewContent?.frame ?? self.view.frame
            self.addChild(controller)
            controller.reloadData()
            self.view.addSubview(controller.view)
        }
    }
    
    func showContent(withItem item:MenuItem){
        if item.modules?.count ?? 0 > 0{
            let controller = TemaViewController(nibName: "TemaViewController", bundle: nil, withArray: item.modules! as! [MenuItem])
            controller.view.frame = self.viewContent?.frame ?? self.view.frame
            controller.delegate = self
            self.btnReturn?.isHidden = false
            self.btnReturn?.isEnabled = true
            self.addChild(controller)
            self.view.addSubview(controller.view)
        }else{
            let id:Int = item.id ?? 0
            var controller:UIViewController?
            switch id {
            case 10:
                controller = ExampleViewController(nibName: "ExampleViewController", bundle: nil)
                break
            case 11:
                controller = ObjetosViewController(nibName: "ObjetosViewController", bundle: nil)
                break
            case 12:
                controller = CaracteristicasViewController(nibName: "CaracteristicasViewController", bundle: nil)
                break
            case 13:
                controller = EmocionesViewController(nibName: "EmocionesViewController", bundle: nil)
                break
            case 14:
                controller = AccionesCotidianasViewController(nibName: "AccionesCotidianasViewController", bundle: nil)
                break
            default:
                controller = ExampleViewController(nibName: "ExampleViewController", bundle: nil)
                break
            }
            controller!.modalPresentationStyle = .fullScreen
            self.present(controller!, animated: true, completion: nil)
        }
        
    }
    
}

