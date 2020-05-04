//
//  CameraViewController.swift
//  MyApp
//
//  Created by Benny Reyes on 04/05/20.
//  Copyright © 2020 Benny Reyes. All rights reserved.
//

import UIKit
import ARKit

class CameraViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    let config = ARWorldTrackingConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(config)
        let capsuleNode = SCNNode(geometry: SCNCapsule(capRadius: 0.3, height: 0.1))
        capsuleNode.position = SCNVector3(0.1, 0.1, -0.1)
        self.sceneView.scene.rootNode.addChildNode(capsuleNode)
    }
    
    @IBAction func btnCloseAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
