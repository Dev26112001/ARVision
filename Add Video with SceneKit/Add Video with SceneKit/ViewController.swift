//
//  ViewController.swift
//  Add Video with SceneKit
//
//  Created by Devjyoti Mohanty on 17/06/23.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        addARVideo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    func addARVideo() {
           
           let fileURL = URL(fileURLWithPath: Bundle.main.path(forResource: "152203 (540p)", ofType: "mp4")!)
           player = AVPlayer(url: fileURL)
           
           let playerGEO = SCNPlane(width: 1.6, height: 0.9)
           playerGEO.firstMaterial?.diffuse.contents = player
           playerGEO.firstMaterial?.isDoubleSided = true
           
           let playerNode = SCNNode(geometry: playerGEO)
           playerNode.position.z = -2.0
           
           sceneView.scene.rootNode.addChildNode(playerNode)
           player!.play()
           
       }
    
    /*
     
     func session(_ session: ARSession, didFailWithError error: Error) {
     // Present an error message to the user
     
     }
     
     func sessionWasInterrupted(_ session: ARSession) {
     // Inform the user that the session has been interrupted, for example, by presenting an overlay
     
     }
     
     func sessionInterruptionEnded(_ session: ARSession) {
     // Reset tracking and/or remove existing anchors if consistent tracking is required
     
     }
     }
     */
}

    
